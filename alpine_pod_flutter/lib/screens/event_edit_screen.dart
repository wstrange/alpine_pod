import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:alpine_pod_flutter/src/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';

final log = Logger('EventEditScreen');

class EventEditScreen extends HookConsumerWidget {
  const EventEditScreen({this.event, super.key});

  final Event? event;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCreating = event == null;

    final titleController = useTextEditingController(text: event?.title);
    final descriptionController = useTextEditingController(text: event?.description);
    final locationController = useTextEditingController(text: event?.location);
    final startTime = useState(event?.startTime ?? DateTime.now());
    final endTime = useState(event?.endTime ?? DateTime.now().add(const Duration(hours: 2)));

    final client = ref.watch(clientProvider);

    var section = ref.watch(sectionProvider);
    var sid = section?.id;

    void save() {
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

      if (isCreating) {
        client.event.createEvent(eventToSave).then((x) {
          // TODO: Navigate to event list or event details
          log.info('Created event $x');
        });
      } else {
        client.event.updateEvent(eventToSave).then((_) {
          // TODO: Navigate to event details
        });
      }
    }

    void reset() {
      titleController.text = event?.title ?? '';
      descriptionController.text = event?.description ?? '';
      locationController.text = event?.location ?? '';
      startTime.value = event?.startTime ?? DateTime.now();
      endTime.value = event?.endTime ?? DateTime.now().add(const Duration(hours: 2));
    }

    return Scaffold(
      appBar: AppBar(
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
            ),
            TextFormField(
              controller: locationController,
              decoration: const InputDecoration(labelText: 'Location'),
            ),
            // TODO: Add date time pickers for start and end time
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
