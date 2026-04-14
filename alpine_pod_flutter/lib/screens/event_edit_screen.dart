import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';

import '../event_types.dart';
import '../signals.dart';
import '../util.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final log = Logger('EventEditScreen');

class EventEditScreen extends HookWidget {
  const EventEditScreen({this.eventId, this.event, super.key});

  final int? eventId;
  final Event? event;

  @override
  Widget build(BuildContext context) {
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final locationController = useTextEditingController();
    final carpoolLocationController = useTextEditingController();
    final minParticipantsController = useTextEditingController();
    final maxParticipantsController = useTextEditingController();

    final startTime = useState<DateTime>(event?.startTime ?? DateTime.now());
    final endTime = useState<DateTime>(
        event?.endTime ?? DateTime.now().add(const Duration(hours: 8)));
    final carpoolTime = useState<DateTime?>(event?.carpoolTime);
    final selectedType = useState<String>(event?.type ?? eventTypes.first);
    final requiresApproval = useState<bool>(event?.requiresApproval ?? true);

    final loadedEvent = useState<Event?>(event);
    final isLoading = useState<bool>(false);
    final error = useState<String?>(null);

    // Load event if eventId is provided but event is null
    useEffect(() {
      if (eventId != null && event == null) {
        Future<void> loadEvent() async {
          isLoading.value = true;
          error.value = null;
          try {
            final fetchedEvent = await client.event.getEvent(eventId!);
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
      }
      return null;
    }, [loadedEvent.value]);

    void reset() {
      final e = loadedEvent.value ?? event;
      titleController.text = e?.title ?? '';
      descriptionController.text = e?.description ?? '';
      locationController.text = e?.eventLocation ?? '';
      carpoolLocationController.text = e?.carpoolLocation ?? '';
      startTime.value = e?.startTime ?? DateTime.now();
      endTime.value =
          e?.endTime ?? DateTime.now().add(const Duration(hours: 8));
      carpoolTime.value = e?.carpoolTime;
      minParticipantsController.text = (e?.minimumParticipants ?? 0).toString();
      maxParticipantsController.text = (e?.maxParticipants ?? 8).toString();
      selectedType.value = e?.type ?? eventTypes.first;
      requiresApproval.value = e?.requiresApproval ?? true;
    }

    void save() async {
      final activeEvent = loadedEvent.value ?? event;
      final isCreating = activeEvent == null || activeEvent.id == null;
      final section = sectionSignal.peek();
      final sid = section?.id;

      if (sid == null) {
        return;
      }

      final locText = locationController.text.trim().isEmpty
          ? null
          : locationController.text.trim();
      final carpoolLocText = carpoolLocationController.text.trim().isEmpty
          ? null
          : carpoolLocationController.text.trim();

      final minParticipants = int.tryParse(minParticipantsController.text) ?? 0;
      final maxParticipants = int.tryParse(maxParticipantsController.text) ?? 8;

      final eventToSave = activeEvent?.copyWith(
            sectionId: sid,
            title: titleController.text,
            description: descriptionController.text,
            eventLocation: locText,
            carpoolLocation: carpoolLocText,
            carpoolTime: carpoolTime.value,
            startTime: startTime.value,
            endTime: endTime.value,
            type: selectedType.value,
            requiresApproval: requiresApproval.value,
            minimumParticipants: minParticipants,
            maxParticipants: maxParticipants,
          ) ??
          Event(
            sectionId: sid,
            title: titleController.text,
            description: descriptionController.text,
            eventLocation: locText,
            carpoolLocation: carpoolLocText,
            carpoolTime: carpoolTime.value,
            startTime: startTime.value,
            endTime: endTime.value,
            type: selectedType.value,
            requiresApproval: requiresApproval.value,
            minimumParticipants: minParticipants,
            maxParticipants: maxParticipants,
          );

      try {
        final Event savedEvent;
        if (isCreating) {
          savedEvent = await client.event.createEvent(eventToSave);
        } else {
          savedEvent = await client.event.updateEvent(eventToSave);
        }
        currentEventsSignal.refresh();
        if (context.mounted) {
          await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Success'),
              content: const Text('Event saved successfully'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
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
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      }
    }

    final activeEvent = loadedEvent.value ?? event;
    final isCreating = activeEvent == null || activeEvent.id == null;

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 30,
              minLines: 5,
            ),
            TextFormField(
              controller: locationController,
              decoration: const InputDecoration(
                labelText: 'Event Location',
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
                child: Text('Carpool',
                    style: TextStyle(fontWeight: FontWeight.w600)),
              ),
            ),
            TextFormField(
              controller: carpoolLocationController,
              decoration: const InputDecoration(
                labelText: 'Carpool Meet Location',
                hintText: 'Address, place name, or Google Maps URL',
                prefixIcon: Icon(Icons.directions_car_outlined),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.access_time),
              title: const Text('Carpool Meet Time'),
              subtitle: Text(carpoolTime.value != null
                  ? eventDateFormat(carpoolTime.value!)
                  : 'Not set'),
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
                    initialTime: TimeOfDay.fromDateTime(
                        carpoolTime.value ?? startTime.value),
                  );
                  if (time != null) {
                    carpoolTime.value = DateTime(
                      date.year,
                      date.month,
                      date.day,
                      time.hour,
                      time.minute,
                    );
                  }
                }
              },
            ),
            const Divider(),
            DropdownButtonFormField<String>(
              initialValue: selectedType.value,
              decoration: const InputDecoration(labelText: 'Event Type'),
              items: eventTypes
                  .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                  .toList(),
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
                    startTime.value = DateTime(
                      date.year,
                      date.month,
                      date.day,
                      time.hour,
                      time.minute,
                    );
                    endTime.value =
                        startTime.value.add(const Duration(hours: 8));
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
                    endTime.value = DateTime(
                      date.year,
                      date.month,
                      date.day,
                      time.hour,
                      time.minute,
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: reset,
              icon: const Icon(Icons.refresh),
              label: const Text('Reset'),
            ),
            ElevatedButton.icon(
              onPressed: save,
              icon: const Icon(Icons.save),
              label: const Text('Save'),
            ),
          ],
        ),
      ],
    );
  }
}
