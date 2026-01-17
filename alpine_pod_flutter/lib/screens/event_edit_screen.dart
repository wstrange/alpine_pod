import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:state_beacon/state_beacon.dart';

import '../util.dart';

final log = Logger('EventEditScreen');

class EventEditScreen extends HookWidget {
  const EventEditScreen({this.event, super.key});

  final Event? event;

  @override
  Widget build(BuildContext context) {
    final isCreating = event == null;

    final titleController = useTextEditingController(text: event?.title);
    final descriptionController =
        useTextEditingController(text: event?.description);
    final locationController = useTextEditingController(text: event?.location);
    final startTime = useState(event?.startTime ?? DateTime.now());
    final endTime = useState(
        event?.endTime ?? DateTime.now().add(const Duration(hours: 8)));

    var section = sectionBeacon.watch(context);
    var sid = section?.id;

    void save() async {
      final eventToSave = event?.copyWith(
            sectionId: sid!,
            title: titleController.text,
            description: descriptionController.text,
            location: locationController.text,
            startTime: startTime.value,
            endTime: endTime.value,
          ) ??
          Event(
            sectionId: sid!,
            title: titleController.text,
            description: descriptionController.text,
            location: locationController.text,
            startTime: startTime.value,
            endTime: endTime.value,
            type: EventType.hike, // TODO: Let user choose
            waitlistEnabled: false,
            requiresApproval: false,
            waiverRequired: false,
          );

      try {
        if (isCreating) {
          await client.event.createEvent(eventToSave);
        } else {
          await client.event.updateEvent(eventToSave);
        }
        currentEventsBeacon.reset();
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
          if (context.mounted) GoRouter.of(context).pop();
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

    void reset() {
      titleController.text = event?.title ?? '';
      descriptionController.text = event?.description ?? '';
      locationController.text = event?.location ?? '';
      startTime.value = event?.startTime ?? DateTime.now();
      endTime.value =
          event?.endTime ?? DateTime.now().add(const Duration(hours: 2));
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            currentEventsBeacon.reset();
            GoRouter.of(context).pop();
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
              decoration: const InputDecoration(labelText: 'Location'),
            ),
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
                    final newStartTime = DateTime(
                      date.year,
                      date.month,
                      date.day,
                      time.hour,
                      time.minute,
                    );
                    startTime.value = newStartTime;
                    endTime.value = newStartTime.add(const Duration(hours: 8));
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
