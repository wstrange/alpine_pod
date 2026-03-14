import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';

import '../event_types.dart';
import '../signals.dart';
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
  late final TextEditingController carpoolLocationController;
  late DateTime startTime;
  late DateTime endTime;
  DateTime? carpoolTime;
  late String _selectedType;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.event?.title);
    descriptionController =
        TextEditingController(text: widget.event?.description);
    locationController = TextEditingController(text: widget.event?.eventLocation);
    carpoolLocationController =
        TextEditingController(text: widget.event?.carpoolLocation);
    startTime = widget.event?.startTime ?? DateTime.now();
    endTime =
        widget.event?.endTime ?? DateTime.now().add(const Duration(hours: 8));
    carpoolTime = widget.event?.carpoolTime;
    _selectedType = widget.event?.type ?? eventTypes.first;
    // If the stored type isn't in our list, fall back to the first entry
    if (!eventTypes.contains(_selectedType)) {
      _selectedType = eventTypes.first;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    locationController.dispose();
    carpoolLocationController.dispose();
    super.dispose();
  }

  void save() async {
    final isCreating = widget.event == null || widget.event?.id == null;
    var section = sectionSignal.peek();
    var sid = section?.id;

    final locText =
        locationController.text.trim().isEmpty ? null : locationController.text.trim();
    final carpoolLocText = carpoolLocationController.text.trim().isEmpty
        ? null
        : carpoolLocationController.text.trim();

    final eventToSave = widget.event?.copyWith(
          sectionId: sid!,
          title: titleController.text,
          description: descriptionController.text,
          eventLocation: locText,
          carpoolLocation: carpoolLocText,
          carpoolTime: carpoolTime,
          startTime: startTime,
          endTime: endTime,
          type: _selectedType,
        ) ??
        Event(
          sectionId: sid!,
          title: titleController.text,
          description: descriptionController.text,
          eventLocation: locText,
          carpoolLocation: carpoolLocText,
          carpoolTime: carpoolTime,
          startTime: startTime,
          endTime: endTime,
          type: _selectedType,
          requiresApproval: true,
        );

    try {
      if (isCreating) {
        await client.event.createEvent(eventToSave);
      } else {
        await client.event.updateEvent(eventToSave);
      }
      currentEventsSignal.refresh();
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
      locationController.text = widget.event?.eventLocation ?? '';
      carpoolLocationController.text = widget.event?.carpoolLocation ?? '';
      carpoolTime = widget.event?.carpoolTime;
      startTime = widget.event?.startTime ?? DateTime.now();
      endTime =
          widget.event?.endTime ?? DateTime.now().add(const Duration(hours: 2));
      _selectedType = widget.event?.type ?? eventTypes.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isCreating = widget.event == null || widget.event?.id == null;

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
              subtitle: Text(carpoolTime != null
                  ? eventDateFormat(carpoolTime!)
                  : 'Not set'),
              trailing: carpoolTime != null
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      tooltip: 'Clear',
                      onPressed: () => setState(() => carpoolTime = null),
                    )
                  : null,
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: carpoolTime ?? startTime,
                  firstDate: DateTime(2025),
                  lastDate: DateTime(2100),
                );
                if (date != null && context.mounted) {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(
                        carpoolTime ?? startTime),
                  );
                  if (time != null) {
                    setState(() {
                      carpoolTime = DateTime(
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
            const Divider(),
            DropdownButtonFormField<String>(
              initialValue: _selectedType,
              decoration: const InputDecoration(labelText: 'Event Type'),
              items: eventTypes
                  .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() => _selectedType = value);
                }
              },
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
                if (date != null && context.mounted) {
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
                if (date != null && context.mounted) {
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
