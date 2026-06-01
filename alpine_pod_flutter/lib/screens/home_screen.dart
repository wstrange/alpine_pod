import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../signals.dart';
import '../widgets/calendar_view.dart';

class HomeScreen extends SignalWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var section = sectionSignal.value;
    var sectionName = section?.name;
    var unreadCount = unreadNotificationsCountSignal.value;
    // var member = currentMemberSignal.value;

    return Scaffold(
      appBar: AppBar(
        title: Text('$sectionName Section', style: TextStyle(fontSize: 16)),
        actions: [
          IconButton(
            icon: Badge(
              label: unreadCount > 0 ? Text(unreadCount.toString()) : null,
              isLabelVisible: unreadCount > 0,
              child: const Icon(Icons.notifications),
            ),
            onPressed: () => context.goNamed('notifications'),
          ),
        ],
      ),
      drawer: Drawer(
        semanticLabel: 'Drawer Menu',
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menu'),
            ),

            // member.map(
            //   data: (m) {
            //     print('m $m');
            //     return Text('$m');
            //   },
            //   error: (e, st) => const Text('Error'),
            //   loading: () => const CircularProgressIndicator(),
            // ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                final m = currentMemberSignal.value;
                if (m == null || m.id == null) return;
                final id = m.id.toString();

                Navigator.pop(context); // Close the drawer
                context.pushNamed('member-edit', pathParameters: {'id': id});
              },
            ),

            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Create Event'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                context.pushNamed('create-event');
              },
            ),
            ListTile(
              leading: const Icon(Icons.people_alt),
              title: const Text('Member Directory'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                context.pushNamed('directory');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                sectionSignal.value = null;
                currentMemberSignal.value = null;
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
