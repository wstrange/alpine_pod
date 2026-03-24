import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals_flutter/signals_flutter.dart';
import '../signals.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emergencyNameController;
  late final TextEditingController _emergencyPhoneController;

  final Set<int> _selectedSectionIds = {};

  @override
  void initState() {
    super.initState();
    final fullName = 'Enter Name';
    final nameParts = fullName.split(' ');

    _firstNameController = TextEditingController(
        text: nameParts.isNotEmpty ? nameParts.first : '');
    _lastNameController = TextEditingController(
        text: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '');
    _emailController = TextEditingController(text: 'Enter Preferred Email');
    _phoneController = TextEditingController(text: 'Enter Phone Number');
    _emergencyNameController =
        TextEditingController(text: 'Enter Emergency Contact Name');
    _emergencyPhoneController =
        TextEditingController(text: 'Enter Emergency Contact Phone');
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _emergencyNameController.dispose();
    _emergencyPhoneController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedSectionIds.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one section.')),
      );
      return;
    }

    try {
      final authInfo = sessionManager.authInfo;
      if (authInfo == null) throw Exception('No user signed in');

      final member = Member(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        email: _emailController.text,
        phoneNumber: _phoneController.text,
        emergencyContactName: _emergencyNameController.text,
        emergencyContactPhone: _emergencyPhoneController.text,
        userId: authInfo.authUserId,
      );

      await client.member.registerMember(member, _selectedSectionIds.toList());

      // Reset signals to reflect changes
      currentMemberSignal.reset();
      userSectionsSignal.reset();
      allMySectionMembershipsSignal.reset();

      if (mounted) {
        context.go('/section-selection');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration failed: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final sectionsValue = allSectionsSignal.watch(context);

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
        key: _formKey,
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
                controller: _firstNameController,
                decoration: const InputDecoration(labelText: 'First Name *'),
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(labelText: 'Last Name *'),
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email *'),
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone Number *'),
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _emergencyNameController,
                decoration: const InputDecoration(
                    labelText: 'Emergency Contact Name *'),
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _emergencyPhoneController,
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
                        value: _selectedSectionIds.contains(section.id),
                        onChanged: (bool? checked) {
                          setState(() {
                            if (checked == true) {
                              _selectedSectionIds.add(section.id!);
                            } else {
                              _selectedSectionIds.remove(section.id);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
              },
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submit,
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
