import 'dart:async';
import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../signals.dart';
import 'member_details_dialog.dart';

/// Shown to event managers — lets them add or remove participants.
class EventParticipantsManager extends HookWidget {
  const EventParticipantsManager({
    super.key,
    required this.event,
    required this.confirmed,
    required this.waitlisted,
    required this.onRefresh,
  });

  final Event event;
  final List<EventRegistration> confirmed;
  final List<EventRegistration> waitlisted;
  final VoidCallback onRefresh;

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
              'Manage Participants',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            FilledButton.icon(
              onPressed: () => _showAddParticipantDialog(context),
              icon: const Icon(Icons.person_add_alt_1, size: 18),
              label: const Text('Add'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        if (confirmed.isNotEmpty) ...[
          Text(
            'Confirmed (${confirmed.length})',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 4),
          ...confirmed.map(
            (reg) => _ParticipantTile(
              registration: reg,
              onRemove: () => _removeParticipant(context, reg),
            ),
          ),
          const SizedBox(height: 8),
        ],
        if (waitlisted.isNotEmpty) ...[
          Text(
            'Waitlist – Pending Approval (${waitlisted.length})',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Colors.orange.shade700,
                ),
          ),
          const SizedBox(height: 4),
          ...waitlisted.map(
            (reg) => _ParticipantTile(
              registration: reg,
              onRemove: () => _removeParticipant(context, reg),
              onApprove: () => _approveParticipant(context, reg),
            ),
          ),
        ],
        if (confirmed.isEmpty && waitlisted.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text('No participants yet.'),
          ),
      ],
    );
  }

  Future<void> _removeParticipant(
    BuildContext context,
    EventRegistration reg,
  ) async {
    final name = reg.member != null
        ? reg.member!.displayName ??
            '${reg.member!.firstName} ${reg.member!.lastName}'
        : 'this participant';

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Remove Participant'),
        content: Text('Remove $name from the event?'),
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

    try {
      await client.eventManager.removeMemberFromEvent(reg.id!);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$name removed from event.')),
        );
        currentEventsSignal.refresh();
        onRefresh();
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error removing participant: $e')),
        );
      }
    }
  }

  Future<void> _approveParticipant(
    BuildContext context,
    EventRegistration reg,
  ) async {
    final name = reg.member != null
        ? reg.member!.displayName ??
            '${reg.member!.firstName} ${reg.member!.lastName}'
        : 'this participant';

    try {
      await client.eventManager.approveRegistration(reg.id!);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$name approved and confirmed.')),
        );
        currentEventsSignal.refresh();
        onRefresh();
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error approving participant: $e')),
        );
      }
    }
  }

  void _showAddParticipantDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => _AddParticipantDialog(
        event: event,
        alreadyRegisteredIds: {
          ...confirmed.map((r) => r.memberId),
          ...waitlisted.map((r) => r.memberId),
        },
        onAdded: () {
          currentEventsSignal.refresh();
          onRefresh();
        },
      ),
    );
  }
}

// ─── Participant tile ────────────────────────────────────────────────────────

class _ParticipantTile extends StatelessWidget {
  const _ParticipantTile({
    required this.registration,
    required this.onRemove,
    this.onApprove,
  });

  final EventRegistration registration;
  final VoidCallback onRemove;
  final VoidCallback? onApprove;

  @override
  Widget build(BuildContext context) {
    final member = registration.member;
    final name = member != null
        ? member.displayName ?? '${member.firstName} ${member.lastName}'
        : 'Unknown Member';

    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 4),
      leading: CircleAvatar(
        radius: 18,
        backgroundImage: member?.profilePictureUrl != null
            ? NetworkImage(member!.profilePictureUrl!)
            : null,
        child: member?.profilePictureUrl == null
            ? Text(
                name.isNotEmpty ? name[0].toUpperCase() : '?',
                style: const TextStyle(fontSize: 14),
              )
            : null,
      ),
      title: Text(name, style: const TextStyle(fontSize: 14)),
      subtitle: member != null
          ? Text(member.email, style: const TextStyle(fontSize: 12))
          : null,
      onTap: member != null
          ? () => showMemberDetailsDialog(context, member)
          : null,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (onApprove != null)
            IconButton(
              icon: const Icon(Icons.check_circle_outline, color: Colors.green),
              tooltip: 'Approve',
              onPressed: onApprove,
            ),
          IconButton(
            icon: Icon(Icons.remove_circle_outline, color: Colors.red.shade600),
            tooltip: 'Remove participant',
            onPressed: onRemove,
          ),
        ],
      ),
    );
  }
}

// ─── Add participant dialog ──────────────────────────────────────────────────

class _AddParticipantDialog extends HookWidget {
  const _AddParticipantDialog({
    required this.event,
    required this.alreadyRegisteredIds,
    required this.onAdded,
  });

  final Event event;
  final Set<int> alreadyRegisteredIds;
  final VoidCallback onAdded;

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
    final filterText = useState('');
    final isLoading = useState(false);

    // Fetch section members with server-side filtering, re-fetching when filter changes
    final membersFuture = useMemoized(
      () => client.member.getSectionMembers(
          sectionId: event.sectionId,
          filter: filterText.value.isEmpty ? null : filterText.value,
          limit: 50,
          offset: 0),
      [event.sectionId, filterText.value],
    );
    final membersSnapshot = useFuture(membersFuture);

    // Debounce the search input
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
      title: const Text('Add Participant'),
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
                              alreadyRegisteredIds.contains(member.id);
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
                                ? Chip(
                                    label: const Text('Registered'),
                                    labelStyle: const TextStyle(fontSize: 11),
                                    padding: EdgeInsets.zero,
                                  )
                                : isLoading.value
                                    ? const SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                            strokeWidth: 2),
                                      )
                                    : null,
                            enabled: !alreadyIn && !isLoading.value,
                            onTap: alreadyIn || isLoading.value
                                ? null
                                : () => _addMember(
                                      ctx,
                                      context,
                                      member,
                                      name,
                                      isLoading,
                                    ),
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

  Future<void> _addMember(
    BuildContext dialogContext,
    BuildContext parentContext,
    Member member,
    String name,
    ValueNotifier<bool> isLoading,
  ) async {
    isLoading.value = true;
    try {
      await client.eventManager.addMemberToEvent(event.id!, member.id!);
      onAdded();
      if (dialogContext.mounted) Navigator.of(dialogContext).pop();
      if (parentContext.mounted) {
        ScaffoldMessenger.of(parentContext).showSnackBar(
          SnackBar(content: Text('$name added to event.')),
        );
      }
    } catch (e) {
      if (parentContext.mounted) {
        ScaffoldMessenger.of(parentContext).showSnackBar(
          SnackBar(content: Text('Error adding participant: $e')),
        );
      }
    } finally {
      if (dialogContext.mounted) isLoading.value = false;
    }
  }
}
