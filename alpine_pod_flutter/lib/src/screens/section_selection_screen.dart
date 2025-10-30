import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:alpine_pod_flutter/src/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SectionSelectionScreen extends HookConsumerWidget {
  const SectionSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Mock data for sections. In a real app, this would come from your backend.
    final sections = ref.watch(userSectionsProvider);

    final selectedSection = useState<Section?>(null);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Section'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: sections.when(
          loading: () => CircularProgressIndicator(),
          error: (err, stack) => Text('Error $err'),
          data: (s) => Column(
            children: [
              Expanded(
                child: RadioGroup<Section>(
                  groupValue: selectedSection.value,
                  onChanged: (newValue) {
                    selectedSection.value = newValue!;
                  },
                  child: ListView.builder(
                    itemCount: s.length,
                    itemBuilder: (context, index) {
                      final section = s[index];
                      return RadioListTile<Section>(
                        title: Text(section.name),
                        value: section,
                      );
                    },
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: selectedSection.value == null
                    ? null
                    : () {
                        // Navigate to the home screen for the selected section
                        ref.read(sectionProvider.notifier).setValue(selectedSection.value!);
                        currentSection = selectedSection.value;
                        context.go('/');
                      },
                child: const Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
