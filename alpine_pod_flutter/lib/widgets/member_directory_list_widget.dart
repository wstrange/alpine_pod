import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
import '../signals.dart';
import 'member_details_dialog.dart';

class MemberDirectoryListWidget extends StatelessWidget {
  final List<SectionMembership> memberships;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final ScrollController? scrollController;
  final bool hasMore;
  final bool isLoadingMore;
  final Function(int memberId, Set<String> newScopes)? onScopesUpdated;

  const MemberDirectoryListWidget({
    super.key,
    required this.memberships,
    this.shrinkWrap = false,
    this.physics,
    this.scrollController,
    this.hasMore = false,
    this.isLoadingMore = false,
    this.onScopesUpdated,
  });

  @override
  Widget build(BuildContext context) {
    // Watch current user's scopes for this section to enable/disable edit features
    mySectionMembershipSignal.watch(context);

    if (memberships.isEmpty && !isLoadingMore) {
      return const Center(child: Text('No members found.'));
    }

    return ListView.separated(
      controller: scrollController,
      shrinkWrap: shrinkWrap,
      physics: physics,
      itemCount: memberships.length + (hasMore ? 1 : 0),
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        if (index == memberships.length) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        }

        final membership = memberships[index];
        final member = membership.member;
        if (member == null) return const SizedBox();

        final name =
            member.displayName ?? '${member.firstName} ${member.lastName}';

        // Prettify scopes for subtitle
        final scopeStr = membership.scopes.join(', ');

        return ListTile(
          leading: CircleAvatar(
            backgroundImage: member.profilePictureUrl != null
                ? NetworkImage(member.profilePictureUrl!)
                : null,
            child: member.profilePictureUrl == null
                ? Text(name.isNotEmpty ? name[0].toUpperCase() : '?')
                : null,
          ),
          title: Text(name),
          subtitle: Text('${member.email}\nRoles: $scopeStr'),
          isThreeLine: true,
          onTap: () => _showMemberDetails(context, membership),
        );
      },
    );
  }

  void _showMemberDetails(BuildContext context, SectionMembership membership) {
    final member = membership.member;
    if (member == null) return;

    showMemberDetailsDialog(
      context,
      member,
      extraActions: [
        if (_canEditScopes())
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _showEditScopesDialog(context, membership);
            },
            child: const Text('Edit Roles'),
          ),
      ],
    );
  }

  bool _canEditScopes() {
    final scopes = sessionManager.authInfo?.scopeNames ?? {};
    if (scopes.contains('serverpod.admin') || scopes.contains('admin')) {
      return true;
    }

    // Check section-specific roles
    final myMembership = mySectionMembershipSignal.value.value;
    if (myMembership != null &&
        myMembership.scopes.contains('sectionManager')) {
      return true;
    }

    return false;
  }

  void _showEditScopesDialog(
      BuildContext context, SectionMembership membership) {
    final member = membership.member;
    if (member == null) return;

    // Create a mutable copy of the scopes
    final selectedScopes = Set<String>.from(membership.scopes);

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Edit Roles'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CheckboxListTile(
                    title: const Text('Section Manager'),
                    value: selectedScopes.contains('sectionManager'),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          selectedScopes.add('sectionManager');
                        } else {
                          selectedScopes.remove('sectionManager');
                        }
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Event Manager'),
                    value: selectedScopes.contains('eventManager'),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          selectedScopes.add('eventManager');
                        } else {
                          selectedScopes.remove('eventManager');
                        }
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Member'),
                    subtitle: const Text('Base member role'),
                    value: selectedScopes.contains('member'),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          selectedScopes.add('member');
                        } else {
                          selectedScopes.remove('member');
                        }
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (onScopesUpdated != null) {
                      onScopesUpdated!(member.id!, selectedScopes);
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
