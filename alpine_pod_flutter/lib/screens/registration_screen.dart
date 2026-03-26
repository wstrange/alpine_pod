import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:signals_flutter/signals_flutter.dart';
import '../signals.dart';

class RegistrationScreen extends HookWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final profileValue = userProfileInfoSignal.watch(context);
    final sectionsValue = allSectionsSignal.watch(context);

    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final emailController = useTextEditingController();
    final phoneController = useTextEditingController();
    final emergencyNameController = useTextEditingController();
    final emergencyPhoneController = useTextEditingController();

    final selectedSectionIds = useState<Set<int>>({});

    // Populate initial values from profile when it becomes available
    useEffect(() {
      if (profileValue is AsyncData && profileValue.value != null) {
        final profile = profileValue.value!;
        if (firstNameController.text.isEmpty &&
            lastNameController.text.isEmpty) {
          final fullName = profile.userName ?? '';
          final nameParts = fullName.split(' ');
          firstNameController.text =
              nameParts.isNotEmpty ? nameParts.first : '';
          lastNameController.text =
              nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';
        }
        if (emailController.text.isEmpty) {
          emailController.text = profile.email ?? '';
        }
      }
      return null;
    }, [profileValue]);

    Future<void> submit() async {
      if (!formKey.currentState!.validate()) return;
      if (selectedSectionIds.value.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select at least one section.')),
        );
        return;
      }

      try {
        final authInfo = sessionManager.authInfo;
        if (authInfo == null) throw Exception('No user signed in');

        final member = Member(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          phoneNumber: phoneController.text,
          emergencyContactName: emergencyNameController.text,
          emergencyContactPhone: emergencyPhoneController.text,
          userId: authInfo.authUserId,
        );

        await client.member
            .registerMember(member, selectedSectionIds.value.toList());

        // Reset signals to reflect changes
        currentMemberSignal.reset();
        allMySectionMembershipsSignal.reset();

        if (context.mounted) {
          // todo: force logout?
          context.go('/section-selection');
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Registration failed: $e')),
          );
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Member Registration'),
        actions: [
          TextButton(
            onPressed: () async {
              await sessionManager.signOutDevice();
              if (context.mounted) context.go('/login');
            },
            child: const Text('Cancel', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Complete your profile',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: firstNameController,
                decoration: const InputDecoration(labelText: 'First Name *'),
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: lastNameController,
                decoration: const InputDecoration(labelText: 'Last Name *'),
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email *'),
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'Phone Number *'),
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: emergencyNameController,
                decoration: const InputDecoration(
                    labelText: 'Emergency Contact Name *'),
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: emergencyPhoneController,
                decoration: const InputDecoration(
                    labelText: 'Emergency Contact Phone *'),
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 24),
              const Text(
                'Select Sections *',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              switch (sectionsValue) {
                AsyncError(:final error) =>
                  Text('Error loading sections: $error'),
                AsyncLoading() =>
                  const Center(child: CircularProgressIndicator()),
                AsyncData(value: final sections) => Column(
                    children: sections.map((section) {
                      return CheckboxListTile(
                        title: Text(section.name),
                        value: selectedSectionIds.value.contains(section.id),
                        onChanged: (bool? checked) {
                          final newIds =
                              Set<int>.from(selectedSectionIds.value);
                          if (checked == true) {
                            newIds.add(section.id!);
                          } else {
                            newIds.remove(section.id);
                          }
                          selectedSectionIds.value = newIds;
                        },
                      );
                    }).toList(),
                  ),
              },
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: submit,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Next', style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
