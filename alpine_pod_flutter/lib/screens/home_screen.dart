import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var section = ref.watch(sectionProvider);

    var sectionName = section?.name;

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
    );
  }
}
