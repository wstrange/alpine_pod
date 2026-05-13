import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:signals_hooks/signals_hooks.dart';
import 'package:alpine_pod_client/alpine_pod_client.dart';
import '../signals.dart';

class MemberEditScreen extends HookWidget {
  final int? memberId;
  const MemberEditScreen({super.key, this.memberId});

  @override
  Widget build(BuildContext context) {
    // Always call hooks unconditionally to maintain consistent hook order.
    final currentMemberValue = currentMemberSignal.watch(context);
    final targetMemberValue = useFutureSignal(
      () => memberId != null
          ? client.member.getMember(memberId!)
          : Future.value(null),
      keys: [memberId],
    ).value;

    final AsyncState<Member?> memberValue =
        memberId == null ? currentMemberValue : targetMemberValue;

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
        title: Text(memberId == null ? 'Edit Profile' : 'Edit Member'),
      ),
      body: switch (memberValue) {
        AsyncError(error: final e) => Center(child: Text('Error: $e')),
        AsyncLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
        AsyncData(value: final member) => member == null
            ? const Center(child: Text('Member not found.'))
            : _MemberEditForm(member: member, memberId: memberId),
      },
    );
  }
}

class _MemberEditForm extends HookWidget {
  final Member member;
  final int? memberId;
  const _MemberEditForm({required this.member, this.memberId});

  @override
  Widget build(BuildContext context) {
    final firstNameController =
        useTextEditingController(text: member.firstName);
    final lastNameController = useTextEditingController(text: member.lastName);
    final displayNameController =
        useTextEditingController(text: member.displayName);
    final bioController = useTextEditingController(text: member.bio);
    final emailController = useTextEditingController(text: member.email);
    final phoneNumberController =
        useTextEditingController(text: member.phoneNumber);
    final emergencyContactNameController =
        useTextEditingController(text: member.emergencyContactName);
    final emergencyContactPhoneController =
        useTextEditingController(text: member.emergencyContactPhone);
    final medicalConditionsController =
        useTextEditingController(text: member.medicalConditions);
    final certificationsController =
        useTextEditingController(text: member.certifications);

    // Re-initialize controllers if the member changes (e.g. after a refresh or navigation)
    useValueChanged<Member, void>(member, (_, __) {
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
    });

    final membershipsValue = memberId == null
        ? allMySectionMembershipsSignal.watch(context)
        : useFutureSignal(
            () => client.member.getMemberSectionMemberships(memberId!),
            keys: [memberId],
          ).value;

    Future<void> save() async {
      try {
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
        await client.member.updateMember(updatedMember);

        if (memberId == null) {
          currentMemberSignal.setValue(updatedMember);
        }

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Profile saved')),
          );
          final router = GoRouter.of(context);
          if (router.canPop()) {
            router.pop();
          } else {
            router.go('/');
          }
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to save profile: $e')),
          );
        }
      }
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

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                const SizedBox(height: 24),
                const Text(
                  'Sections and Roles',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                switch (membershipsValue) {
                  AsyncError(error: final e) => Text('Error loading roles: $e'),
                  AsyncLoading() => const CircularProgressIndicator(),
                  AsyncData(value: final memberships) => memberships.isEmpty
                      ? const Text('No section memberships found.')
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: memberships.length,
                          itemBuilder: (context, index) {
                            final m = memberships[index];
                            final sectionName =
                                m.section?.name ?? 'Section ${m.sectionId}';
                            final roles = m.scopes.join(', ');
                            return ListTile(
                              title: Text(sectionName),
                              subtitle: Text('Roles: $roles'),
                              contentPadding: EdgeInsets.zero,
                            );
                          },
                        ),
                },
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton.icon(
                onPressed: () {
                  final router = GoRouter.of(context);
                  if (router.canPop()) {
                    router.pop();
                  } else {
                    router.go('/');
                  }
                },
                icon: const Icon(Icons.close),
                label: const Text('Cancel'),
              ),
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
