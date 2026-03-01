import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
import '../signals.dart';

class MemberDirectoryListWidget extends StatefulWidget {
  final List<SectionMembership> memberships;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final Function(int memberId, Set<String> newScopes)? onScopesUpdated;

  const MemberDirectoryListWidget({
    super.key,
    required this.memberships,
    this.shrinkWrap = false,
    this.physics,
    this.onScopesUpdated,
  });

  @override
  State<MemberDirectoryListWidget> createState() =>
      _MemberDirectoryListWidgetState();
}

class _MemberDirectoryListWidgetState extends State<MemberDirectoryListWidget> {
  @override
  Widget build(BuildContext context) {
    // Watch current user's scopes for this section to enable/disable edit features
    mySectionMembershipSignal.watch(context);

    if (widget.memberships.isEmpty) {
      return const Center(child: Text('No members found.'));
    }

    return ListView.separated(
      shrinkWrap: widget.shrinkWrap,
      physics: widget.physics,
      itemCount: widget.memberships.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final membership = widget.memberships[index];
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
    final name = member.displayName ?? '${member.firstName} ${member.lastName}';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(name),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (member.profilePictureUrl != null)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage:
                            NetworkImage(member.profilePictureUrl!),
                      ),
                    ),
                  ),
                _buildDetailRow(Icons.email, 'Email', member.email),
                _buildDetailRow(Icons.phone, 'Phone', member.phoneNumber),
                if (member.bio != null && member.bio!.isNotEmpty)
                  _buildDetailRow(Icons.info, 'Bio', member.bio!),
                const Divider(),
                const Text('Emergency Contact',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                _buildDetailRow(
                    Icons.person, 'Name', member.emergencyContactName),
                _buildDetailRow(
                    Icons.phone, 'Phone', member.emergencyContactPhone),
              ],
            ),
          ),
          actions: [
            if (_canEditScopes())
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _showEditScopesDialog(context, membership);
                },
                child: const Text('Edit Roles'),
              ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  bool _canEditScopes() {
    final scopes = sessionManager.authInfo?.scopeNames ?? {};
    if (scopes.contains('admin')) return true;

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
                    if (widget.onScopesUpdated != null) {
                      widget.onScopesUpdated!(member.id!, selectedScopes);
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

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.grey[600]),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
