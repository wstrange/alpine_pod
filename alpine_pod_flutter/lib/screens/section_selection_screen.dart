import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:state_beacon/state_beacon.dart';
import '../provider.dart';

class SectionSelectionScreen extends HookWidget {
  const SectionSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sectionsValue = userSectionsBeacon.watch(context);
    final selectedSection = useBeacon(Beacon.writable<Section?>(null));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Section'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: sectionsValue.toWidget(
          onLoading: () => const Center(child: CircularProgressIndicator()),
          onError: (err, stack) => Center(child: Text('Error $err')),
          onData: (s) => Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: s.length,
                  itemBuilder: (context, index) {
                    final section = s[index];
                    return BeaconBuilder(
                      beacon: selectedSection,
                      builder: (context, current) {
                        return RadioListTile<Section>(
                          title: Text(section.name),
                          value: section,
                          groupValue: current,
                          onChanged: (newValue) {
                            selectedSection.value = newValue;
                          },
                        );
                      }
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: selectedSection.value == null
                    ? null
                    : () {
                        // Navigate to the home screen for the selected section
                        sectionBeacon.value = selectedSection.value;
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
