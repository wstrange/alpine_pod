import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:state_beacon/state_beacon.dart';

import '../beacon.dart';
import '../util.dart';

final log = Logger('EventEditScreen');

class EventEditScreen extends StatefulWidget {
  const EventEditScreen({this.event, super.key});

  final Event? event;

  @override
  State<EventEditScreen> createState() => _EventEditScreenState();
}

class _EventEditScreenState extends State<EventEditScreen> {
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;
  late final TextEditingController locationController;
  late DateTime startTime;
  late DateTime endTime;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.event?.title);
    descriptionController =
        TextEditingController(text: widget.event?.description);
    locationController = TextEditingController(text: widget.event?.location);
    startTime = widget.event?.startTime ?? DateTime.now();
    endTime =
        widget.event?.endTime ?? DateTime.now().add(const Duration(hours: 8));
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    locationController.dispose();
    super.dispose();
  }

  void save() async {
    final isCreating = widget.event == null;
    var section = sectionBeacon.peek();
    var sid = section?.id;

    final eventToSave = widget.event?.copyWith(
          sectionId: sid!,
          title: titleController.text,
          description: descriptionController.text,
          location: locationController.text,
          startTime: startTime,
          endTime: endTime,
        ) ??
        Event(
          sectionId: sid!,
          title: titleController.text,
          description: descriptionController.text,
          location: locationController.text,
          startTime: startTime,
          endTime: endTime,
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
      if (mounted) {
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
        if (mounted) GoRouter.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
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
    setState(() {
      titleController.text = widget.event?.title ?? '';
      descriptionController.text = widget.event?.description ?? '';
      locationController.text = widget.event?.location ?? '';
      startTime = widget.event?.startTime ?? DateTime.now();
      endTime =
          widget.event?.endTime ?? DateTime.now().add(const Duration(hours: 2));
    });
  }

  @override
  Widget build(BuildContext context) {
    final isCreating = widget.event == null;
    sectionBeacon.watch(context); // Watch for rebuilds if section changes

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
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
              subtitle: Text(eventDateFormat(startTime)),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: startTime,
                  firstDate: DateTime(2025),
                  lastDate: DateTime(2050),
                );
                if (date != null && mounted) {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(startTime),
                  );
                  if (time != null) {
                    setState(() {
                      startTime = DateTime(
                        date.year,
                        date.month,
                        date.day,
                        time.hour,
                        time.minute,
                      );
                      endTime = startTime.add(const Duration(hours: 8));
                    });
                  }
                }
              },
            ),
            ListTile(
              title: const Text('End Time'),
              subtitle: Text(eventDateFormat(endTime)),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: endTime,
                  firstDate: startTime,
                  lastDate: DateTime(2100),
                );
                if (date != null && mounted) {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(endTime),
                  );
                  if (time != null) {
                    setState(() {
                      endTime = DateTime(
                        date.year,
                        date.month,
                        date.day,
                        time.hour,
                        time.minute,
                      );
                    });
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
