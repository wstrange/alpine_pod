import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals_flutter/signals_flutter.dart';
import '../signals.dart';
import '../widgets/calendar_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var section = sectionSignal.watch(context);
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
            ListTile(
              leading: const Icon(Icons.people_alt),
              title: const Text('Member Directory'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                GoRouter.of(context).push('/directory');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                sectionSignal.value = null;
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

// class EventListDisplay extends StatelessWidget {
//   final List<Event> events;

//   const EventListDisplay(this.events, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: events.length,
//         itemBuilder: (context, i) {
//           final event = events[i];
//           final startDate = event.startTime.toLocal();
//           final endDate = event.endTime.toLocal();
//           final description = event.description;
//           final truncatedDesc = description.length > 30
//               ? '${description.substring(0, 30)}...'
//               : description;

//           return ListTile(
//             title: Text(event.title),
//             subtitle: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   '${_formatDateTime(startDate)} - ${_formatDateTime(endDate)}',
//                   style: const TextStyle(fontSize: 12),
//                 ),
//                 if (truncatedDesc.isNotEmpty)
//                   Text(
//                     truncatedDesc,
//                     style: const TextStyle(
//                         fontSize: 12, fontStyle: FontStyle.italic),
//                   ),
//               ],
//             ),
//             onTap: () {
//               GoRouter.of(context).push('/event-view', extra: event);
//             },
//           );
//         });
//   }
// }

// String _formatDateTime(DateTime dt) {
//   return '${dt.month}/${dt.day}/${dt.year} ${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
// }
