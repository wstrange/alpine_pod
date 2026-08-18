import 'package:material_ui/material_ui.dart';
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
    final useCache = useClientCacheSignal.value;

    return Scaffold(
      appBar: AppBar(
        title: Text('$sectionName Section', style: const TextStyle(fontSize: 16)),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Tooltip(
              message: useCache ? 'Client Cache: ON' : 'Client Cache: OFF',
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    useCache ? Icons.storage : Icons.cloud_outlined,
                    size: 18,
                    color: useCache ? Theme.of(context).colorScheme.primary : Colors.grey,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Cache',
                    style: TextStyle(
                      fontSize: 12,
                      color: useCache ? Theme.of(context).colorScheme.primary : Colors.grey,
                      fontWeight: useCache ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  Transform.scale(
                    scale: 0.8,
                    child: Switch(
                      value: useCache,
                      onChanged: (val) {
                        useClientCacheSignal.value = val;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: Badge(
              label: unreadCount > 0 ? Text(unreadCount.toString()) : null,
              isLabelVisible: unreadCount > 0,
              child: const Icon(Icons.notifications),
            ),
            onPressed: () => context.pushNamed('notifications'),
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

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                final m = currentMemberSignal.value;
                if (m == null) return;
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
            SwitchListTile(
              secondary: Icon(useCache ? Icons.storage : Icons.cloud_outlined),
              title: const Text('Client Cache'),
              subtitle: Text(useCache ? 'Using local SQLite cache' : 'Direct server fetching'),
              value: useCache,
              onChanged: (val) {
                useClientCacheSignal.value = val;
              },
            ),
            if (useCache)
              SwitchListTile(
                secondary: const Icon(Icons.history),
                title: const Text('Sync Changes Only'),
                subtitle: const Text('Only fetch events updated since last sync'),
                value: syncOnlyUpdatedDataSignal.value,
                onChanged: (val) {
                  syncOnlyUpdatedDataSignal.value = val;
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
