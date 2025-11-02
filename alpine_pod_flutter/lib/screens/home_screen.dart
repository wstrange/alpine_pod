import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:alpine_pod_flutter/src/widgets/event_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var section = ref.watch(sectionProvider);

    var sectionName = section?.name;

    var events = ref.watch(currentEventsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Section: $sectionName'),
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
              title: const Text('Logout'),
              onTap: () {
                ref.read(sectionProvider.notifier).setValue(null);
                sessionManager.signOutDevice();
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      body: switch (events) {
        AsyncData(:final value) => EventListDisplay(value),
        AsyncError(:final error, :final stackTrace) => Center(
            child: Text('Error: $error\nStack: $stackTrace'),
          ),
        AsyncLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
      },
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
          return ListTile(
            title: Text(events[i].title),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(events[i].title),
                content: EventView(event: events[i]),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Close'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      GoRouter.of(context).push('/event-details', extra: events[i]);
                    },
                    child: const Text('Edit'),
                  ),
                ],
              ),
            );
          },
          );
        });
  }
}
