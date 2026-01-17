import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:state_beacon/state_beacon.dart';
import '../beacon.dart';

class SectionSelectionScreen extends StatefulWidget {
  const SectionSelectionScreen({super.key});

  @override
  State<SectionSelectionScreen> createState() => _SectionSelectionScreenState();
}

class _SectionSelectionScreenState extends State<SectionSelectionScreen> {
  Section? _selectedSection;

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
          AsyncData(value: final s) => Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: s.length,
                    itemBuilder: (context, index) {
                      final section = s[index];
                      return RadioListTile<Section>(
                        title: Text(section.name),
                        value: section,
                        groupValue: _selectedSection,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedSection = newValue;
                          });
                        },
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: _selectedSection == null
                      ? null
                      : () {
                          // Navigate to the home screen for the selected section
                          sectionBeacon.value = _selectedSection;
                          context.go('/');
                        },
                  child: const Text('Continue'),
                ),
              ],
            ),
        },
      ),
    );
  }
}
