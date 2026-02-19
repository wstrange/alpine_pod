import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals_flutter/signals_flutter.dart';
import '../signals.dart';

class SectionSelectionScreen extends StatelessWidget {
  const SectionSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sectionsValue = userSectionsSignal.watch(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Section'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: switch (sectionsValue) {
          AsyncError(:final error) => Center(child: Text('Error $error')),
          AsyncLoading() => const Center(
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
                    sectionSignal.value = section;
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
