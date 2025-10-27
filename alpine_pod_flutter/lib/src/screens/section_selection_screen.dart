import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SectionSelectionScreen extends HookWidget {
  const SectionSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for sections. In a real app, this would come from your backend.
    final sections = ['Section 1', 'Section 2', 'Section 3'];
    final selectedSection = useState<String?>(null);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Section'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: sections.length,
                itemBuilder: (context, index) {
                  final section = sections[index];
                  return RadioListTile<String>(
                    title: Text(section),
                    value: section,
                    groupValue: selectedSection.value,
                    onChanged: (newValue) {
                      selectedSection.value = newValue;
                    },
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the home screen for the selected section
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}