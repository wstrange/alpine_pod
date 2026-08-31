import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:bloc_signals_flutter/bloc_signals_flutter.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:material_ui/material_ui.dart';
import 'package:signals_hooks/signals_hooks.dart';

import '../event_types.dart';
import '../repositories/event_repository.dart';
import '../signals.dart';
import '../util.dart';
import '../widgets/event_managers_manager.dart';
import '../widgets/template_browser_dialog.dart';

final log = Logger('EventEditScreen2');

// =============================================================================
// CubitSignal managing the Event entity directly
// =============================================================================

/// CubitSignal that holds the [Event] instance directly as its state.
/// Each mutation method calls emit() directly — no event dispatch indirection.
class EventEditCubit extends CubitSignal<Event> {
  final Event? initialEvent;
  final Member? currentMember;
  final UuidValue defaultSectionId;

  // Signals for async loading state — readable by the widget via Watch.
  final isLoading = signal(false);
  final error = signal<String?>(null);

  EventEditCubit({this.initialEvent, this.currentMember, required this.defaultSectionId})
    : super(
        initialState: initialEvent ?? _createDefaultEvent(sectionId: defaultSectionId, currentMember: currentMember),
      );

  // ---------------------------------------------------------------------------
  // Mutation methods — call these from widget callbacks.
  // ---------------------------------------------------------------------------

  /// Replaces the entire event (e.g. after loading from the repository).
  void setEvent(Event event) => emit(event);

  /// Updates the start time (and auto-advances end time by 8 hours).
  void updateStartTime(DateTime t) => emit(stateValue.copyWith(startTime: t, endTime: t.add(const Duration(hours: 8))));

  /// Updates the end time.
  void updateEndTime(DateTime t) => emit(stateValue.copyWith(endTime: t));

  /// Updates or clears the carpool meet time.
  void updateCarpoolTime(DateTime? t) => emit(stateValue.copyWith(carpoolTime: t));

  /// Updates the event type.
  void updateType(String type) => emit(stateValue.copyWith(type: type));

  /// Updates whether registrations require approval.
  void updateRequiresApproval(bool v) => emit(stateValue.copyWith(requiresApproval: v));

  /// Updates the published flag.
  void updatePublished(bool v) => emit(stateValue.copyWith(published: v));

  /// Replaces the full manager list.
  void updateManagers(List<Member> managers) => emit(
    stateValue.copyWith(
      eventManagers: managers.map((m) => EventManager(eventId: stateValue.id, memberId: m.id, member: m)).toList(),
    ),
  );

  /// Resets to the initial event (or a blank default).
  void reset() => emit(initialEvent ?? _createDefaultEvent(sectionId: defaultSectionId, currentMember: currentMember));

  // ---------------------------------------------------------------------------

  /// Loads an event by [eventId] from the repository. Returns the fetched
  /// event so the caller (a useEffect) can sync text controllers without
  /// calling cubit methods inside build(), satisfying avoid_emit_in_build.
  Future<Event?> loadEventById(UuidValue eventId) async {
    isLoading.value = true;
    error.value = null;
    try {
      final fetched = await eventRepository.getEvent(eventId);
      if (fetched != null) {
        setEvent(fetched);
        return fetched;
      } else {
        error.value = 'Event not found';
        return null;
      }
    } catch (err) {
      error.value = err.toString();
      return null;
    } finally {
      isLoading.value = false;
    }
  }

  static Event _createDefaultEvent({required UuidValue sectionId, Member? currentMember}) {
    final now = DateTime.now();
    final eventId = const Uuid().v7obj();
    return Event(
      id: eventId,
      sectionId: sectionId,
      title: 'Untitled Event',
      description: 'Enter event description (supports markdown)',
      type: eventTypes.first,
      startTime: now,
      endTime: now.add(const Duration(hours: 8)),
      minimumParticipants: 1,
      maxParticipants: 10,
      requiresApproval: true,
      published: false,
      eventManagers: currentMember != null
          ? [EventManager(eventId: eventId, memberId: currentMember.id, member: currentMember)]
          : null,
    );
  }

  List<Member> get managers =>
      stateValue.eventManagers?.where((m) => m.member != null).map((m) => m.member!).toList() ?? [];
}

// =============================================================================
// Hybrid HookWidget + CubitSignal View: EventEditScreen2
// =============================================================================

class EventEditScreen2 extends HookWidget {
  final UuidValue? eventId;
  final Event? event;

  const EventEditScreen2({super.key, this.eventId, this.event});

  @override
  Widget build(BuildContext context) {
    // 1. Reactive global signals
    final section = sectionSignal.value;
    final currentMember = currentMemberSignal.value;

    // 2. Flutter Hooks for form controllers, transient UI state & lifecycle
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final locationController = useTextEditingController();
    final carpoolLocationController = useTextEditingController();
    final minParticipantsController = useTextEditingController();
    final maxParticipantsController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final isSaving = useState(false);

    // 3. Initialize and manage the CubitSignal lifecycle via Flutter Hooks
    final cubit = useMemoized(
      () => EventEditCubit(initialEvent: event, currentMember: currentMember, defaultSectionId: section!.id!),
      [event, currentMember, section?.id],
    );

    useEffect(() => cubit.close, [cubit]);

    // 4. Synchronize text controllers with Event values
    void syncControllers(Event e) {
      titleController.text = e.title;
      descriptionController.text = e.description;
      locationController.text = e.eventLocation ?? '';
      carpoolLocationController.text = e.carpoolLocation ?? '';
      minParticipantsController.text = e.minimumParticipants.toString();
      maxParticipantsController.text = e.maxParticipants.toString();
    }

    // Populate controllers initially
    useEffect(() {
      if (event != null) {
        syncControllers(event!);
      } else {
        minParticipantsController.text = '1';
        maxParticipantsController.text = '10';
      }
      return null;
    }, const []);

    // Load event from repository if eventId is provided but event is null.
    // We call cubit.loadEventById() — a regular async method — so no
    // avoid_emit_in_build violations occur.
    useEffect(() {
      if (eventId != null && event == null) {
        cubit.loadEventById(eventId!).then((fetched) {
          if (fetched != null) syncControllers(fetched);
        });
      }
      return null;
    }, [eventId, event]);

    // Reset handler
    void onReset() {
      cubit.reset();
      syncControllers(cubit.stateValue);
    }

    // Save handler
    Future<void> onSave() async {
      if (!formKey.currentState!.validate()) return;

      final sec = section;
      if (sec == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('No section selected. Please select a section first.')));
        return;
      }

      final minParticipants = int.tryParse(minParticipantsController.text) ?? 1;
      final maxParticipants = int.tryParse(maxParticipantsController.text) ?? 10;

      if (minParticipants > maxParticipants) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Minimum participants cannot be greater than maximum participants.')),
        );
        return;
      }

      final isCreating = event == null && eventId == null;
      final eventToSave = cubit.stateValue.copyWith(
        sectionId: sec.id!,
        title: titleController.text.trim(),
        description: descriptionController.text.trim(),
        eventLocation: locationController.text.trim().isEmpty ? null : locationController.text.trim(),
        carpoolLocation: carpoolLocationController.text.trim().isEmpty ? null : carpoolLocationController.text.trim(),
        minimumParticipants: minParticipants,
        maxParticipants: maxParticipants,
      );

      isSaving.value = true;
      try {
        final Event savedEvent;
        if (isCreating) {
          final additionalManagerIds = cubit.managers.where((m) => m.id != currentMember?.id).map((m) => m.id).toList();

          savedEvent = await eventRepository.createEvent(
            eventToSave,
            additionalManagerIds: additionalManagerIds.isEmpty ? null : additionalManagerIds,
            notifyNewEvent: true,
          );
        } else {
          savedEvent = await eventRepository.updateEvent(eventToSave);
        }

        currentEventsSignal.refresh();

        if (context.mounted) {
          final msg = savedEvent.published ? 'Published live to site' : 'DRAFT: Not visible to other members.';
          await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Success'),
              content: Text('Event saved successfully. Event Status: $msg'),
              actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('OK'))],
            ),
          );
          if (context.mounted) {
            GoRouter.of(context).go('/event-view/${savedEvent.id}');
          }
        }
      } catch (e) {
        if (context.mounted) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Error'),
              content: Text('Error saving event: $e'),
              actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('OK'))],
            ),
          );
        }
      } finally {
        isSaving.value = false;
      }
    }

    // Read cubit loading/error signals reactively via hooks.
    final isLoadingEvent = useSignalValue(cubit.isLoading);
    final loadError = useSignalValue(cubit.error);

    if (isLoadingEvent) {
      return Scaffold(
        appBar: AppBar(title: const Text('Loading...')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (loadError != null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: Center(child: Text('Error: $loadError')),
      );
    }

    final isCreating = event == null && eventId == null;
    final sid = section?.id;

    // 5. Build UI reacting directly to the CubitSignal<Event>
    return BlocSignalBuilder<EventEditCubit, Event>(
      bloc: cubit,
      builder: (context, currentEvent) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => GoRouter.of(context).go('/')),
            title: Text(isCreating ? 'Create Event (v2)' : 'Edit Event (v2)'),
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: titleController,
                          decoration: const InputDecoration(labelText: 'Title'),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Title is required';
                            }
                            return null;
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 4.0),
                              child: Text(
                                'Description',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white70),
                              ),
                            ),
                            TextButton.icon(
                              onPressed: () async {
                                final template = await showDialog<String>(
                                  context: context,
                                  builder: (context) => const TemplateBrowserDialog(),
                                );
                                if (template != null) {
                                  final currentText = descriptionController.text;
                                  final selection = descriptionController.selection;
                                  if (selection.baseOffset < 0) {
                                    descriptionController.text =
                                        currentText + (currentText.isEmpty ? '' : '\n\n') + template;
                                  } else {
                                    final newText = currentText.replaceRange(selection.start, selection.end, template);
                                    descriptionController.value = descriptionController.value.copyWith(
                                      text: newText,
                                      selection: TextSelection.collapsed(offset: selection.start + template.length),
                                    );
                                  }
                                }
                              },
                              icon: const Icon(Icons.library_books),
                              label: const Text('Insert Markdown template'),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: descriptionController,
                          decoration: const InputDecoration(hintText: 'Enter event description (supports markdown)'),
                          maxLines: 30,
                          minLines: 5,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Description is required';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: locationController,
                          decoration: const InputDecoration(
                            labelText: 'Event Location (supports markdown)',
                            hintText: 'Address, place name, or Google Maps URL',
                            prefixIcon: Icon(Icons.map_outlined),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Divider(),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: Text('Carpool', style: TextStyle(fontWeight: FontWeight.w600)),
                          ),
                        ),
                        TextFormField(
                          controller: carpoolLocationController,
                          decoration: const InputDecoration(
                            labelText: 'Carpool Meet Location (supports markdown)',
                            hintText: 'Address, place name, or Google Maps URL',
                            prefixIcon: Icon(Icons.directions_car_outlined),
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: const Icon(Icons.access_time),
                          title: const Text('Carpool Meet Time'),
                          subtitle: Text(
                            currentEvent.carpoolTime != null ? eventDateFormat(currentEvent.carpoolTime!) : 'Not set',
                          ),
                          trailing: currentEvent.carpoolTime != null
                              ? IconButton(
                                  icon: const Icon(Icons.clear),
                                  tooltip: 'Clear',
                                  onPressed: () => cubit.updateCarpoolTime(null),
                                )
                              : null,
                          onTap: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate: currentEvent.carpoolTime ?? currentEvent.startTime,
                              firstDate: DateTime(2025),
                              lastDate: DateTime(2100),
                            );
                            if (date != null && context.mounted) {
                              final time = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.fromDateTime(currentEvent.carpoolTime ?? currentEvent.startTime),
                              );
                              if (time != null) {
                                cubit.updateCarpoolTime(
                                  DateTime(date.year, date.month, date.day, time.hour, time.minute),
                                );
                              }
                            }
                          },
                        ),
                        const Divider(),
                        DropdownButtonFormField<String>(
                          initialValue: currentEvent.type,
                          decoration: const InputDecoration(labelText: 'Event Type'),
                          items: eventTypes.map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              cubit.updateType(value);
                            }
                          },
                        ),
                        SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          secondary: const Icon(Icons.how_to_reg_outlined),
                          title: const Text('Requires Approval'),
                          subtitle: Text(
                            currentEvent.requiresApproval
                                ? 'Registrations go to a waitlist and must be approved'
                                : 'Members can register directly without approval',
                          ),
                          value: currentEvent.requiresApproval,
                          onChanged: cubit.updateRequiresApproval,
                        ),
                        SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          secondary: const Icon(Icons.publish_outlined),
                          title: const Text('Published'),
                          subtitle: Text(
                            currentEvent.published
                                ? 'Event is published and visible to members'
                                : 'Event is a draft and only visible to event managers',
                          ),
                          value: currentEvent.published,
                          onChanged: cubit.updatePublished,
                        ),
                        const Divider(),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: minParticipantsController,
                                decoration: const InputDecoration(
                                  labelText: 'Min Participants',
                                  prefixIcon: Icon(Icons.person_outline),
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  final min = int.tryParse(value ?? '');
                                  if (min == null || min < 1) {
                                    return 'Must be at least 1';
                                  }
                                  final max = int.tryParse(maxParticipantsController.text);
                                  if (max != null && min > max) {
                                    return 'Must be ≤ max';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: TextFormField(
                                controller: maxParticipantsController,
                                decoration: const InputDecoration(
                                  labelText: 'Max Participants',
                                  prefixIcon: Icon(Icons.people_outline),
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  final max = int.tryParse(value ?? '');
                                  if (max == null || max < 1) {
                                    return 'Must be at least 1';
                                  }
                                  final min = int.tryParse(minParticipantsController.text);
                                  if (min != null && max < min) {
                                    return 'Must be ≥ min';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        ListTile(
                          title: const Text('Start Time'),
                          subtitle: Text(eventDateFormat(currentEvent.startTime)),
                          onTap: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate: currentEvent.startTime,
                              firstDate: DateTime(2025),
                              lastDate: DateTime(2050),
                            );
                            if (date != null && context.mounted) {
                              final time = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.fromDateTime(currentEvent.startTime),
                              );
                              if (time != null) {
                                cubit.updateStartTime(
                                  DateTime(date.year, date.month, date.day, time.hour, time.minute),
                                );
                              }
                            }
                          },
                        ),
                        ListTile(
                          title: const Text('End Time'),
                          subtitle: Text(eventDateFormat(currentEvent.endTime)),
                          onTap: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate: currentEvent.endTime,
                              firstDate: currentEvent.startTime,
                              lastDate: DateTime(2100),
                            );
                            if (date != null && context.mounted) {
                              final time = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.fromDateTime(currentEvent.endTime),
                              );
                              if (time != null) {
                                cubit.updateEndTime(DateTime(date.year, date.month, date.day, time.hour, time.minute));
                              }
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        if (sid != null)
                          EventManagersManager(
                            eventId: isCreating ? null : currentEvent.id,
                            sectionId: sid,
                            managers: cubit.managers,
                            onChanged: cubit.updateManagers,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          persistentFooterButtons: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(onPressed: onReset, icon: const Icon(Icons.refresh), label: const Text('Reset')),
                ElevatedButton.icon(
                  onPressed: !isSaving.value ? onSave : null,
                  icon: isSaving.value
                      ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2))
                      : const Icon(Icons.save),
                  label: Text(isSaving.value ? 'Saving...' :  'Save'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
