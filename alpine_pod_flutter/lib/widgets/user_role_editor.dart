import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:signals_hooks/signals_hooks.dart';
import 'package:alpine_pod_client/alpine_pod_client.dart';
import '../signals.dart';

class UserRoleEditor extends HookWidget {
  final UuidValue memberId;
  final UuidValue sectionId;
  final String? sectionName;

  const UserRoleEditor({super.key, required this.memberId, required this.sectionId, this.sectionName});

  @override
  Widget build(BuildContext context) {
    // Fetch the target member's memberships and find the one for this section
    final membershipSignal = useFutureSignal(
      () => client.member
          .getMemberSectionMemberships(memberId)
          .then(
            (memberships) => memberships.firstWhere(
              (m) => m.sectionId == sectionId,
              orElse: () => throw Exception('Membership not found'),
            ),
          ),
      keys: [memberId, sectionId],
    );

    return SignalBuilder(
      builder: (context) {
        // Check permissions
        final isAdmin = isGlobalAdminSignal.value;
        final myMemberships = allMySectionMembershipsSignal.value.value ?? [];
        final isManagerOfThisSection = myMemberships.any(
          (m) => m.sectionId == sectionId && m.scopes.contains('sectionManager'),
        );

        final canEdit = isAdmin || isManagerOfThisSection;
        final membershipValue = membershipSignal.value;

        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (sectionName != null)
                  Text(sectionName!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                switch (membershipValue) {
                  AsyncError(error: final e) => Text('Error: $e'),
                  AsyncLoading() => const Center(
                    child: Padding(padding: EdgeInsets.all(8.0), child: CircularProgressIndicator()),
                  ),
                  AsyncData(value: final membership) => _RoleSelector(
                    membership: membership,
                    canEdit: canEdit,
                    isGlobalAdmin: isAdmin,
                    onChanged: (newScopes) async {
                      try {
                        await client.member.updateMemberScopes(memberId, sectionId, newScopes);
                        // Invalidate the signal to trigger a refresh
                        membershipSignal.refresh();
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Roles updated')));
                        }
                      } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text('Failed to update roles: $e')));
                        }
                      }
                    },
                  ),
                },
              ],
            ),
          ),
        );
      },
    );
  }
}

class _RoleSelector extends HookWidget {
  final SectionMembership membership;
  final bool canEdit;
  final bool isGlobalAdmin;
  final ValueChanged<Set<String>> onChanged;

  const _RoleSelector({
    required this.membership,
    required this.canEdit,
    required this.isGlobalAdmin,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final currentScopes = useState<Set<String>>(membership.scopes.toSet());

    // Sync with membership data if it changes
    useValueChanged<SectionMembership, void>(membership, (_, _) {
      currentScopes.value = membership.scopes.toSet();
    });

    final roles = [
      ('member', 'Member', 'Basic access to the section.'),
      ('eventManager', 'Trip Leader', 'Can manage events they lead.'),
      ('sectionManager', 'Section Manager', 'Can manage section users and events.'),
      ('admin', 'Admin', 'Full global administrative access.'),
    ];

    return Column(
      children: roles.map((role) {
        final scope = role.$1;
        final label = role.$2;
        final subtitle = role.$3;

        // Only global admins can grant/revoke the 'admin' role
        final isRestricted = scope == 'admin' && !isGlobalAdmin;
        final effectivelyDisabled = !canEdit || isRestricted;

        return CheckboxListTile(
          title: Text(label),
          subtitle: Text(subtitle),
          value: currentScopes.value.contains(scope),
          onChanged: effectivelyDisabled
              ? null
              : (bool? checked) {
                  final newScopes = Set<String>.from(currentScopes.value);
                  if (checked == true) {
                    newScopes.add(scope);
                  } else {
                    // Prevent removing 'member' scope as it's the base role?
                    // Actually, let's allow it if they really want to remove access.
                    newScopes.remove(scope);
                  }
                  currentScopes.value = newScopes;
                  onChanged(newScopes);
                },
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
          dense: true,
        );
      }).toList(),
    );
  }
}
