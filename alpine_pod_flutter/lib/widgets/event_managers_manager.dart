import 'dart:async';
import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../signals.dart';
import 'member_details_dialog.dart';

/// Manage the list of event managers.
/// Can be used both during creation (local state) and editing (immediate server actions).
class EventManagersManager extends HookWidget {
  const EventManagersManager({
    super.key,
    this.eventId,
    required this.sectionId,
    required this.managers,
    required this.onChanged,
  });

  final int? eventId;
  final int sectionId;
  final List<Member> managers;
  final Function(List<Member>) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(thickness: 1.5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Event Managers',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            FilledButton.icon(
              onPressed: () => _showAddManagerDialog(context),
              icon: const Icon(Icons.person_add_alt_1, size: 18),
              label: const Text('Add'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        if (managers.isNotEmpty)
          ...managers.map(
            (member) => _ManagerTile(
              member: member,
              onRemove: () => _removeManager(context, member),
            ),
          )
        else
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text('No managers assigned.'),
          ),
      ],
    );
  }

  Future<void> _removeManager(BuildContext context, Member member) async {
    final name = member.displayName ?? '${member.firstName} ${member.lastName}';

    // Don't allow removing if it's the only manager and we are editing
    if (managers.length <= 1 && eventId != null) {
       ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('At least one manager is required.')),
      );
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Remove Manager'),
        content: Text('Remove $name as an event manager?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: FilledButton.styleFrom(
              backgroundColor: Colors.red.shade600,
            ),
            child: const Text('Remove'),
          ),
        ],
      ),
    );

    if (confirmed != true || !context.mounted) return;

    if (eventId != null) {
      // Immediate server action
      try {
        await client.eventManager.removeEventManager(
          EventManager(eventId: eventId!, memberId: member.id!),
        );
        onChanged(managers.where((m) => m.id != member.id).toList());
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error removing manager: $e')),
          );
        }
      }
    } else {
      // Local state update
      onChanged(managers.where((m) => m.id != member.id).toList());
    }
  }

  void _showAddManagerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => _AddManagerDialog(
        sectionId: sectionId,
        alreadyManagerIds: managers.map((m) => m.id!).toSet(),
        onAdded: (member) async {
          if (eventId != null) {
            // Immediate server action
            try {
              await client.eventManager.assignEventManager(
                EventManager(eventId: eventId!, memberId: member.id!),
              );
              onChanged([...managers, member]);
            } catch (e) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error adding manager: $e')),
                );
              }
            }
          } else {
            // Local state update
            onChanged([...managers, member]);
          }
        },
      ),
    );
  }
}

class _ManagerTile extends StatelessWidget {
  const _ManagerTile({
    required this.member,
    required this.onRemove,
  });

  final Member member;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final name = member.displayName ?? '${member.firstName} ${member.lastName}';

    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 4),
      leading: CircleAvatar(
        radius: 18,
        backgroundImage: member.profilePictureUrl != null
            ? NetworkImage(member.profilePictureUrl!)
            : null,
        child: member.profilePictureUrl == null
            ? Text(
                name.isNotEmpty ? name[0].toUpperCase() : '?',
                style: const TextStyle(fontSize: 14),
              )
            : null,
      ),
      title: Text(name, style: const TextStyle(fontSize: 14)),
      subtitle: Text(member.email, style: const TextStyle(fontSize: 12)),
      onTap: () => showMemberDetailsDialog(context, member),
      trailing: IconButton(
        icon: Icon(Icons.remove_circle_outline, color: Colors.red.shade600),
        tooltip: 'Remove manager',
        onPressed: onRemove,
      ),
    );
  }
}

class _AddManagerDialog extends HookWidget {
  const _AddManagerDialog({
    required this.sectionId,
    required this.alreadyManagerIds,
    required this.onAdded,
  });

  final int sectionId;
  final Set<int> alreadyManagerIds;
  final Function(Member) onAdded;

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
    final filterText = useState('');
    final isLoading = useState(false);

    final membersFuture = useMemoized(
      () => client.member.getSectionMembers(
          sectionId: sectionId,
          filter: filterText.value.isEmpty ? null : filterText.value,
          limit: 50,
          offset: 0),
      [sectionId, filterText.value],
    );
    final membersSnapshot = useFuture(membersFuture);

    final debounceTimer = useRef<Timer?>(null);
    useEffect(() {
      void listener() {
        debounceTimer.value?.cancel();
        debounceTimer.value = Timer(const Duration(milliseconds: 500), () {
          filterText.value = searchController.text.trim();
        });
      }

      searchController.addListener(listener);
      return () {
        debounceTimer.value?.cancel();
        searchController.removeListener(listener);
      };
    }, [searchController]);

    final filtered = membersSnapshot.data ?? <Member>[];

    return AlertDialog(
      title: const Text('Add Event Manager'),
      contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      content: SizedBox(
        width: 360,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: searchController,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Search members…',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                isDense: true,
              ),
            ),
            const SizedBox(height: 8),
            if (membersSnapshot.connectionState == ConnectionState.waiting)
              const Padding(
                padding: EdgeInsets.all(16),
                child: CircularProgressIndicator(),
              )
            else if (membersSnapshot.hasError)
              Text('Error loading members: ${membersSnapshot.error}')
            else
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 300),
                child: filtered.isEmpty
                    ? const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text('No members found.'),
                      )
                    : ListView.separated(
                        shrinkWrap: true,
                        itemCount: filtered.length,
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemBuilder: (ctx, i) {
                          final member = filtered[i];
                          final alreadyIn =
                              alreadyManagerIds.contains(member.id);
                          final name = member.displayName ??
                              '${member.firstName} ${member.lastName}';
                          return ListTile(
                            dense: true,
                            leading: CircleAvatar(
                              radius: 18,
                              backgroundImage: member.profilePictureUrl != null
                                  ? NetworkImage(member.profilePictureUrl!)
                                  : null,
                              child: member.profilePictureUrl == null
                                  ? Text(
                                      name.isNotEmpty
                                          ? name[0].toUpperCase()
                                          : '?',
                                      style: const TextStyle(fontSize: 14),
                                    )
                                  : null,
                            ),
                            title: Text(name),
                            subtitle: Text(member.email),
                            trailing: alreadyIn
                                ? const Icon(Icons.check, color: Colors.green)
                                : null,
                            enabled: !alreadyIn && !isLoading.value,
                            onTap: alreadyIn || isLoading.value
                                ? null
                                : () {
                                    onAdded(member);
                                    Navigator.of(context).pop();
                                  },
                          );
                        },
                      ),
              ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
