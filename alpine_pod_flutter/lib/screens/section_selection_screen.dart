import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:signals_flutter/signals_flutter.dart';
import '../signals.dart';

class const SectionSelectionScreen({super.key}) extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select a Section')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SignalBuilder(
          builder: (context) {
            final membershipsValue = allMySectionMembershipsSignal.value;
            return switch (membershipsValue) {
              AsyncError(:final error) => Center(child: Text('Error $error')),
              AsyncLoading() => const Center(child: CircularProgressIndicator()),
              AsyncData(value: final memberships) => ListView.builder(
                itemCount: memberships.length,
                itemBuilder: (context, index) {
                  final section = memberships[index].section;
                  if (section == null) return const SizedBox.shrink();
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
            };
          },
        ),
      ),
    );
  }
}
