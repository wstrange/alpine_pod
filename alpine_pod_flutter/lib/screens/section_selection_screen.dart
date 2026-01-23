import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:state_beacon/state_beacon.dart';
import '../beacon.dart';

class SectionSelectionScreen extends StatelessWidget {
  const SectionSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sectionsValue = userSectionsBeacon.watch(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Section'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: switch (sectionsValue) {
          AsyncError(error: final err) => Center(child: Text('Error $err')),
          AsyncLoading() || AsyncIdle() => const Center(
              child: CircularProgressIndicator(),
            ),
          AsyncData(value: final s) => ListView.builder(
              itemCount: s.length,
              itemBuilder: (context, index) {
                final section = s[index];
                return ListTile(
                  title: Text(section.name),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Navigate to the home screen for the selected section
                    sectionBeacon.value = section;
                    context.go('/');
                  },
                );
              },
            ),
        },
      ),
    );
  }
}
