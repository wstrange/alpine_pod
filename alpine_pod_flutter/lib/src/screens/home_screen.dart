import 'package:alpine_pod_flutter/src/provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../widgets/bottom_nav_bar.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var section = ref.watch(sectionProvider);

    print('section = $section');
    var sectionName = currentSection?.name ?? 'NA';
    print(sectionName);

    var sectionsList = ref.watch(userSectionsProvider);

    print(' ${sectionsList.value}');

    print(sessionManager.signedInUser);

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
                currentSection = null;
                sessionManager.signOutDevice();
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 10, // Mock data
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Upcoming Event ${index + 1}'),
            subtitle: const Text('Event details...'),
            onTap: () {
              // Navigate to event details screen
            },
          );
        },
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
