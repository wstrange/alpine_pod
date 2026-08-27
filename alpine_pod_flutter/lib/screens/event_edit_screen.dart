import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../event_types.dart';
import '../repositories/event_repository.dart';
import '../signals.dart';
import '../util.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

import '../widgets/event_managers_manager.dart';
import '../widgets/template_browser_dialog.dart';

final log = Logger('EventEditScreen');

class EventEditScreen extends HookWidget {
  final UuidValue? eventId;
  final Event? event;

  const EventEditScreen({super.key, this.eventId, this.event});

  @override
  Widget build(BuildContext context) {
    final isOnline = isOnlineSignal.value;
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final locationController = useTextEditingController();
    final carpoolLocationController = useTextEditingController();
    final minParticipantsController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final maxParticipantsController = useTextEditingController();

    final startTime = useState<DateTime>(event?.startTime ?? DateTime.now());
    final endTime = useState<DateTime>(event?.endTime ?? DateTime.now().add(const Duration(hours: 8)));
    final carpoolTime = useState<DateTime?>(event?.carpoolTime);
    final selectedType = useState<String>(event?.type ?? eventTypes.first);
    final requiresApproval = useState<bool>(event?.requiresApproval ?? true);
    final published = useState<bool>(event?.published ?? false);

    final loadedEvent = useState<Event?>(event);
    final isLoading = useState<bool>(false);
    final error = useState<String?>(null);

    final managers = useState<List<Member>>([]);

    // Initialize managers for new event — read signal value imperatively (not reactively)
    useEffect(() {
      final memberState = currentMemberSignal.value;
      final currentMember = memberState is AsyncData ? memberState : null;
      if (eventId == null && event == null && currentMember != null && managers.value.isEmpty) {
        managers.value = [currentMember];
      }
      return null;
    }, [currentMemberSignal.value]);

    // Load event if eventId is provided but event is null
    useEffect(() {
      if (eventId != null && event == null) {
        Future<void> loadEvent() async {
          isLoading.value = true;
          error.value = null;
          try {
            final fetchedEvent = await eventRepository.getEvent(eventId!);
            loadedEvent.value = fetchedEvent;
          } catch (e) {
            error.value = e.toString();
          } finally {
            isLoading.value = false;
          }
        }

        loadEvent();
      }
      return null;
    }, [eventId, event]);

    // Update controllers when loadedEvent changes
    useEffect(() {
      final e = loadedEvent.value;
      if (e != null) {
        titleController.text = e.title;
        descriptionController.text = e.description;
        locationController.text = e.eventLocation ?? '';
        carpoolLocationController.text = e.carpoolLocation ?? '';
        startTime.value = e.startTime;
        endTime.value = e.endTime;
        carpoolTime.value = e.carpoolTime;
        minParticipantsController.text = (e.minimumParticipants).toString();
        maxParticipantsController.text = (e.maxParticipants).toString();
        selectedType.value = e.type;
        requiresApproval.value = e.requiresApproval;
        published.value = e.published;

        // Load managers from the event if they are included
        if (e.eventManagers != null) {
          managers.value = e.eventManagers!.where((m) => m.member != null).map((m) => m.member!).toList();
        }
      }
      return null;
    }, [loadedEvent.value]);

    void reset() {
      final e = loadedEvent.value ?? event;
      if (e != null) {
        titleController.text = e.title;
        descriptionController.text = e.description;
        locationController.text = e.eventLocation ?? '';
        carpoolLocationController.text = e.carpoolLocation ?? '';
        startTime.value = e.startTime;
        endTime.value = e.endTime;
        carpoolTime.value = e.carpoolTime;
        minParticipantsController.text = (e.minimumParticipants).toString();
        maxParticipantsController.text = (e.maxParticipants).toString();
        selectedType.value = e.type;
        requiresApproval.value = e.requiresApproval;
        published.value = e.published;
        if (e.eventManagers != null) {
          managers.value = e.eventManagers!.where((m) => m.member != null).map((m) => m.member!).toList();
        }
      } else {
        titleController.clear();
        descriptionController.clear();
        locationController.clear();
        carpoolLocationController.clear();
        startTime.value = DateTime.now();
        endTime.value = DateTime.now().add(const Duration(hours: 8));
        carpoolTime.value = null;
        minParticipantsController.clear();
        maxParticipantsController.clear();
        selectedType.value = eventTypes.first;
        requiresApproval.value = true;
        published.value = false;
        final currentMember = currentMemberSignal.value;
        managers.value = currentMember != null ? [currentMember] : [];
      }
    }

    Future<void> save() async {
      if (!isOnline) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('You are currently offline. Saving events requires an internet connection.')),
        );
        return;
      }
      if (!formKey.currentState!.validate()) {
        return;
      }

      final activeEvent = loadedEvent.value ?? event;
      final isCreating = activeEvent == null;
      final section = sectionSignal.value;
      final currentMember = currentMemberSignal.value;

      if (section == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('No section selected. Please select a section first.')));
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

      final eventToSave = isCreating
          ? Event(
            sectionId: section.id!,
            title: titleController.text.trim(),
            description: descriptionController.text.trim(),
            eventLocation: locationController.text.trim().isEmpty ? null : locationController.text.trim(),
            carpoolLocation: carpoolLocationController.text.trim().isEmpty ? null : carpoolLocationController.text.trim(),
            carpoolTime: carpoolTime.value,
            startTime: startTime.value,
            endTime: endTime.value,
            type: selectedType.value,
            requiresApproval: requiresApproval.value,
            minimumParticipants: minParticipants,
            maxParticipants: maxParticipants,
            published: published.value,
          )
          : activeEvent.copyWith(
            title: titleController.text.trim(),
            description: descriptionController.text.trim(),
            eventLocation: locationController.text.trim().isEmpty ? null : locationController.text.trim(),
            carpoolLocation: carpoolLocationController.text.trim().isEmpty ? null : carpoolLocationController.text.trim(),
            carpoolTime: carpoolTime.value,
            startTime: startTime.value,
            endTime: endTime.value,
            type: selectedType.value,
            requiresApproval: requiresApproval.value,
            minimumParticipants: minParticipants,
            maxParticipants: maxParticipants,
            published: published.value,
          );

      try {
        final Event savedEvent;
        if (isCreating) {
          // Pass additional manager IDs (excluding creator who is added by default)
          final additionalManagerIds = managers.value.where((m) => m.id != currentMember?.id).map((m) => m.id).toList();

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
          final msg = savedEvent.published ? "Published live to site" : "DRAFT: Not visible to other members.";
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
      }
    }

    final activeEvent = loadedEvent.value ?? event;
    final isCreating = activeEvent == null;

    if (isLoading.value) {
      return Scaffold(
        appBar: AppBar(title: const Text('Loading...')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (error.value != null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: Center(child: Text('Error: ${error.value}')),
      );
    }

    final sid = sectionSignal.value?.id;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).go('/');
          },
        ),
        title: Text(isCreating ? 'Create Event' : 'Edit Event'),
      ),
      body: Column(
        children: [
          if (!isOnline)
            Container(
              width: double.infinity,
              color: Colors.amber.shade100,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                children: [
                  Icon(Icons.cloud_off, size: 18, color: Colors.amber.shade900),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Offline Mode: Event creation and editing are disabled.',
                      style: TextStyle(fontSize: 12, color: Colors.amber.shade900, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
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
                          descriptionController.text = currentText + (currentText.isEmpty ? '' : '\n\n') + template;
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
                subtitle: Text(carpoolTime.value != null ? eventDateFormat(carpoolTime.value!) : 'Not set'),
                trailing: carpoolTime.value != null
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        tooltip: 'Clear',
                        onPressed: () => carpoolTime.value = null,
                      )
                    : null,
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: carpoolTime.value ?? startTime.value,
                    firstDate: DateTime(2025),
                    lastDate: DateTime(2100),
                  );
                  if (date != null && context.mounted) {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(carpoolTime.value ?? startTime.value),
                    );
                    if (time != null) {
                      carpoolTime.value = DateTime(date.year, date.month, date.day, time.hour, time.minute);
                    }
                  }
                },
              ),
              const Divider(),
              DropdownButtonFormField<String>(
                initialValue: selectedType.value,
                decoration: const InputDecoration(labelText: 'Event Type'),
                items: eventTypes.map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
                onChanged: (value) {
                  if (value != null) {
                    selectedType.value = value;
                  }
                },
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                secondary: const Icon(Icons.how_to_reg_outlined),
                title: const Text('Requires Approval'),
                subtitle: Text(
                  requiresApproval.value
                      ? 'Registrations go to a waitlist and must be approved'
                      : 'Members can register directly without approval',
                ),
                value: requiresApproval.value,
                onChanged: (val) => requiresApproval.value = val,
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                secondary: const Icon(Icons.publish_outlined),
                title: const Text('Published'),
                subtitle: Text(
                  published.value
                      ? 'Event is published and visible to members'
                      : 'Event is a draft and only visible to event managers',
                ),
                value: published.value,
                onChanged: (val) => published.value = val,
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
                subtitle: Text(eventDateFormat(startTime.value)),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: startTime.value,
                    firstDate: DateTime(2025),
                    lastDate: DateTime(2050),
                  );
                  if (date != null && context.mounted) {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(startTime.value),
                    );
                    if (time != null) {
                      startTime.value = DateTime(date.year, date.month, date.day, time.hour, time.minute);
                      endTime.value = startTime.value.add(const Duration(hours: 8));
                    }
                  }
                },
              ),
              ListTile(
                title: const Text('End Time'),
                subtitle: Text(eventDateFormat(endTime.value)),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: endTime.value,
                    firstDate: startTime.value,
                    lastDate: DateTime(2100),
                  );
                  if (date != null && context.mounted) {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(endTime.value),
                    );
                    if (time != null) {
                      endTime.value = DateTime(date.year, date.month, date.day, time.hour, time.minute);
                    }
                  }
                },
              ),
              const SizedBox(height: 16),
              if (sid != null)
                EventManagersManager(
                  eventId: activeEvent?.id,
                  sectionId: sid,
                  managers: managers.value,
                  onChanged: (newList) => managers.value = newList,
                ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(onPressed: reset, icon: const Icon(Icons.refresh), label: const Text('Reset')),
            ElevatedButton.icon(
              onPressed: isOnline ? save : null,
              icon: const Icon(Icons.save),
              label: Text(isOnline ? 'Save' : 'Save (Offline)'),
            ),
          ],
        ),
      ],
    );
  }
}
