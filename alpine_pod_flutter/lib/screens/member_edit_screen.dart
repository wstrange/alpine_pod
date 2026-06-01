import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:signals_hooks/signals_hooks.dart';
import 'package:alpine_pod_client/alpine_pod_client.dart';
import '../signals.dart';
import '../widgets/user_role_editor.dart';

class MemberEditScreen extends HookWidget {
  final int memberId;
  const MemberEditScreen({super.key, required this.memberId});

  @override
  Widget build(BuildContext context) {
    // Always call hooks unconditionally to maintain consistent hook order.
    final targetMemberSignal = useFutureSignal<Member?>(() => client.member.getMember(memberId), keys: [memberId]);

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
      body: targetMemberSignal.value.map(
        data: (Member? member) =>
            member == null ? const Center(child: Text('Member not found')) : _MemberEditForm(member: member),
        error: (e, _) => Center(child: Text('Error: $e')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class _MemberEditForm extends HookWidget {
  final Member member;
  const _MemberEditForm({required this.member});

  @override
  Widget build(BuildContext context) {
    final memberId = member.id!;
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

    // Re-initialize controllers if the member changes (e.g. after a refresh or navigation)
    useValueChanged<Member, void>(member, (_, _) {
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

    final reloadMemberships = useSignal(0);
    final membershipsFutureSignal = useFutureSignal(
      () => client.member.getMemberSectionMemberships(memberId),
      keys: [memberId, reloadMemberships.value],
    );

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

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profile saved')));
          final router = GoRouter.of(context);
          if (router.canPop()) {
            router.pop();
          } else {
            router.go('/');
          }
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to save profile: $e')));
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

    return SignalBuilder(
      builder: (context) {
        final membershipsValue = membershipsFutureSignal.value;

        final allSectionsValue = allSectionsSignal.value;
        final isGlobalAdmin = isGlobalAdminSignal.value;

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
                    const SizedBox(height: 24),
                    const Text('Sections and Roles', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    switch (membershipsValue) {
                      AsyncError(error: final e) => Text('Error loading roles: $e'),
                      AsyncLoading() => const CircularProgressIndicator(),
                      AsyncData(value: final memberships) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (memberships.isEmpty) const Text('No section memberships found.'),
                          ...memberships.map(
                            (m) => UserRoleEditor(
                              memberId: m.memberId,
                              sectionId: m.sectionId,
                              sectionName: m.section?.name,
                            ),
                          ),
                          if (isGlobalAdmin) ...[
                            const SizedBox(height: 16),
                            switch (allSectionsValue) {
                              AsyncData(value: final allSections) => () {
                                final currentSectionIds = memberships.map((m) => m.sectionId).toSet();
                                final availableSections = allSections
                                    .where((s) => !currentSectionIds.contains(s.id))
                                    .toList();

                                if (availableSections.isEmpty) {
                                  return const SizedBox.shrink();
                                }

                                return ElevatedButton.icon(
                                  onPressed: () async {
                                    final selectedSection = await showDialog<Section>(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Text('Add to Section'),
                                        content: SizedBox(
                                          width: double.maxFinite,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: availableSections.length,
                                            itemBuilder: (context, index) {
                                              final s = availableSections[index];
                                              return ListTile(
                                                title: Text(s.name),
                                                onTap: () => Navigator.pop(context, s),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    );

                                    if (selectedSection != null && context.mounted) {
                                      try {
                                        await client.member.addMemberToSection(
                                          SectionMembership(
                                            memberId: memberId,
                                            sectionId: selectedSection.id!,
                                            scopes: {'member'},
                                          ),
                                        );
                                        reloadMemberships.value++;
                                      } catch (e) {
                                        if (context.mounted) {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(SnackBar(content: Text('Failed to add to section: $e')));
                                        }
                                      }
                                    }
                                  },
                                  icon: const Icon(Icons.add),
                                  label: const Text('Add to Section'),
                                );
                              }(),
                              _ => const SizedBox.shrink(),
                            },
                          ],
                        ],
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
                  ElevatedButton.icon(onPressed: reset, icon: const Icon(Icons.refresh), label: const Text('Reset')),
                  ElevatedButton.icon(onPressed: save, icon: const Icon(Icons.save), label: const Text('Save')),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
