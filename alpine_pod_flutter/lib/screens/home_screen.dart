import 'package:alpine_pod_client/alpine_pod_client.dart';
import '../widgets/event_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:state_beacon/state_beacon.dart';
import '../beacon.dart';
import '../widgets/calendar_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var section = sectionBeacon.watch(context);
    var sectionName = section?.name;

    return Scaffold(
      appBar: AppBar(
        title: Text('$sectionName Section', style: TextStyle(fontSize: 16)),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                GoRouter.of(context).push('/profile');
              },
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Create Event'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                GoRouter.of(context).push('/create-event');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                sectionBeacon.value = null;
                sessionManager.signOutDevice();
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      body: const CalendarView(),
    );
  }
}

class EventListDisplay extends StatelessWidget {
  final List<Event> events;

  const EventListDisplay(this.events, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, i) {
          final event = events[i];
          final startDate = event.startTime.toLocal();
          final endDate = event.endTime.toLocal();
          final description = event.description;
          final truncatedDesc = description.length > 30
              ? '${description.substring(0, 30)}...'
              : description;

          return ListTile(
            title: Text(event.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${_formatDateTime(startDate)} - ${_formatDateTime(endDate)}',
                  style: const TextStyle(fontSize: 12),
                ),
                if (truncatedDesc.isNotEmpty)
                  Text(
                    truncatedDesc,
                    style: const TextStyle(
                        fontSize: 12, fontStyle: FontStyle.italic),
                  ),
              ],
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  // title: Text(events[i].title),
                  content: EventView(event: events[i]),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Close'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        GoRouter.of(context)
                            .push('/event-details', extra: events[i]);
                      },
                      child: const Text('Edit'),
                    ),
                    TextButton(
                      onPressed: () async {
                        try {
                          final member = await client.member.getCurrentMember();
                          if (member == null) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('User member not found')),
                              );
                            }
                            return;
                          }

                          final registration = EventRegistration(
                            memberId: member.id!,
                            eventId: event.id!,
                            registrationStatus: RegistrationStatus.pending,
                            registrationDate: DateTime.now(),
                            waiverAccepted: true, // Assuming true for now
                            modifiedAt: DateTime.now(),
                          );

                          await client.registration
                              .registerForEvent(registration);

                          if (context.mounted) {
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      'Successfully registered for ${event.title}')),
                            );
                          }
                        } catch (e) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Failed to register: $e')),
                            );
                          }
                        }
                      },
                      child: const Text('Register'),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}

String _formatDateTime(DateTime dt) {
  return '${dt.month}/${dt.day}/${dt.year} ${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
}
