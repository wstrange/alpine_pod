import 'package:signals_flutter/signals_flutter.dart';
import 'package:alpine_pod_client/alpine_pod_client.dart';
import '../signals.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MemberEditScreen extends StatelessWidget {
  const MemberEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final memberValue = currentMemberSignal.watch(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            final router = GoRouter.of(context);
            if (router.canPop()) {
              router.pop();
            } else {
              router.go('/');
            }
          },
        ),
        title: const Text('Edit Profile'),
      ),
      body: switch (memberValue) {
        AsyncError(error: final e) => Center(child: Text('Error: $e')),
        AsyncLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
        AsyncData(value: final member) => member == null
            ? const Center(child: Text('Not logged in.'))
            : _MemberEditForm(member: member),
      },
    );
  }
}

class _MemberEditForm extends StatefulWidget {
  final Member member;
  const _MemberEditForm({required this.member});

  @override
  State<_MemberEditForm> createState() => _MemberEditFormState();
}

class _MemberEditFormState extends State<_MemberEditForm> {
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController displayNameController;
  late final TextEditingController bioController;
  late final TextEditingController emailController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController emergencyContactNameController;
  late final TextEditingController emergencyContactPhoneController;
  late final TextEditingController medicalConditionsController;
  late final TextEditingController certificationsController;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController(text: widget.member.firstName);
    lastNameController = TextEditingController(text: widget.member.lastName);
    displayNameController =
        TextEditingController(text: widget.member.displayName);
    bioController = TextEditingController(text: widget.member.bio);
    emailController = TextEditingController(text: widget.member.email);
    phoneNumberController =
        TextEditingController(text: widget.member.phoneNumber);
    emergencyContactNameController =
        TextEditingController(text: widget.member.emergencyContactName);
    emergencyContactPhoneController =
        TextEditingController(text: widget.member.emergencyContactPhone);
    medicalConditionsController =
        TextEditingController(text: widget.member.medicalConditions);
    certificationsController =
        TextEditingController(text: widget.member.certifications);
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    displayNameController.dispose();
    bioController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    emergencyContactNameController.dispose();
    emergencyContactPhoneController.dispose();
    medicalConditionsController.dispose();
    certificationsController.dispose();
    super.dispose();
  }

  void save() {
    final updatedMember = widget.member.copyWith(
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
      currentMemberSignal.reset();
    });
  }

  void reset() {
    setState(() {
      firstNameController.text = widget.member.firstName;
      lastNameController.text = widget.member.lastName;
      displayNameController.text = widget.member.displayName ?? '';
      bioController.text = widget.member.bio ?? '';
      emailController.text = widget.member.email;
      phoneNumberController.text = widget.member.phoneNumber;
      emergencyContactNameController.text = widget.member.emergencyContactName;
      emergencyContactPhoneController.text =
          widget.member.emergencyContactPhone;
      medicalConditionsController.text = widget.member.medicalConditions ?? '';
      certificationsController.text = widget.member.certifications ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
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
                  decoration: const InputDecoration(
                      labelText: 'Emergency Contact Name'),
                ),
                TextFormField(
                  controller: emergencyContactPhoneController,
                  decoration: const InputDecoration(
                      labelText: 'Emergency Contact Phone'),
                ),
                TextFormField(
                  controller: medicalConditionsController,
                  decoration:
                      const InputDecoration(labelText: 'Medical Conditions'),
                ),
                TextFormField(
                  controller: certificationsController,
                  decoration:
                      const InputDecoration(labelText: 'Certifications'),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
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
        ),
      ],
    );
  }
}
