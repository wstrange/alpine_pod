import '../provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MemberEditScreen extends HookConsumerWidget {
  const MemberEditScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memberAsync = ref.watch(currentMemberProvider);

    return memberAsync.when(
      data: (member) {
        if (member == null) {
          return const Scaffold(
            body: Center(
              child: Text('Not logged in.'),
            ),
          );
        }

        final client = ref.watch(clientProvider);

        final firstNameController = useTextEditingController(text: member.firstName);
        final lastNameController = useTextEditingController(text: member.lastName);
        final displayNameController = useTextEditingController(text: member.displayName);
        final bioController = useTextEditingController(text: member.bio);
        final emailController = useTextEditingController(text: member.email);
        final phoneNumberController = useTextEditingController(text: member.phoneNumber);
        final emergencyContactNameController = useTextEditingController(text: member.emergencyContactName);
        final emergencyContactPhoneController = useTextEditingController(text: member.emergencyContactPhone);
        final medicalConditionsController = useTextEditingController(text: member.medicalConditions);
        final certificationsController = useTextEditingController(text: member.certifications);

        void save() {
          final updatedMember = member.copyWith(
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            displayName: displayNameController.text,
            bio: bioController.text,
            email: emailController.text,
            phoneNumber: phoneNumberController.text,
            emergencyContactName: emergencyContactNameController.text,
            emergencyContactPhone: emergencyContactPhoneController.text,
            medicalConditions: medicalConditionsController.text,
            certifications: certificationsController.text,
          );
          client.member.updateMember(updatedMember).then((_) {
            final newVal = ref.refresh(currentMemberProvider);
          });
        }

        void reset() {
          firstNameController.text = member.firstName;
          lastNameController.text = member.lastName;
          displayNameController.text = member.displayName ?? '';
          bioController.text = member.bio ?? '';
          emailController.text = member.email;
          phoneNumberController.text = member.phoneNumber;
          emergencyContactNameController.text = member.emergencyContactName;
          emergencyContactPhoneController.text = member.emergencyContactPhone;
          medicalConditionsController.text = member.medicalConditions ?? '';
          certificationsController.text = member.certifications ?? '';
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Edit Profile'),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: firstNameController,
                  decoration: const InputDecoration(labelText: 'First Name'),
                ),
                TextFormField(
                  controller: lastNameController,
                  decoration: const InputDecoration(labelText: 'Last Name'),
                ),
                TextFormField(
                  controller: displayNameController,
                  decoration: const InputDecoration(labelText: 'Display Name'),
                ),
                TextFormField(
                  controller: bioController,
                  decoration: const InputDecoration(labelText: 'Bio'),
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  controller: phoneNumberController,
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                ),
                TextFormField(
                  controller: emergencyContactNameController,
                  decoration: const InputDecoration(labelText: 'Emergency Contact Name'),
                ),
                TextFormField(
                  controller: emergencyContactPhoneController,
                  decoration: const InputDecoration(labelText: 'Emergency Contact Phone'),
                ),
                TextFormField(
                  controller: medicalConditionsController,
                  decoration: const InputDecoration(labelText: 'Medical Conditions'),
                ),
                TextFormField(
                  controller: certificationsController,
                  decoration: const InputDecoration(labelText: 'Certifications'),
                ),
              ],
            ),
          ),
          persistentFooterButtons: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: reset,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reset'),
                ),
                ElevatedButton.icon(
                  onPressed: save,
                  icon: const Icon(Icons.save),
                  label: const Text('Save'),
                ),
              ],
            ),
          ],
        );
      },
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (err, stack) => Scaffold(
        body: Center(
          child: Text('Error: $err'),
        ),
      ),
    );
  }
}
