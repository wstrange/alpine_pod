import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:signals_hooks/signals_hooks.dart';
import '../signals.dart';

/// The main admin dashboard. Only accessible to users with the 'admin' scope.
class AdminHomeScreen extends HookWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 2);

    return Scaffold(
      backgroundColor: const Color(0xFF0F1117),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1D27),
        elevation: 0,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6C63FF), Color(0xFF4ECDC4)],
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text(
                'ADMIN',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 11,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'Alpine Pod Control Panel',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white70),
            tooltip: 'Sign out',
            onPressed: () {
              sectionSignal.value = null;
              sessionManager.signOutDevice();
            },
          ),
        ],
        bottom: TabBar(
          controller: tabController,
          indicatorColor: const Color(0xFF6C63FF),
          indicatorWeight: 3,
          labelColor: const Color(0xFF6C63FF),
          unselectedLabelColor: Colors.white54,
          tabs: const [
            Tab(icon: Icon(Icons.terrain), text: 'Sections'),
            Tab(icon: Icon(Icons.people), text: 'Members'),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          _SectionsTab(),
          _MembersTab(),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Sections Tab
// ---------------------------------------------------------------------------

class _SectionsTab extends HookWidget {
  const _SectionsTab();

  @override
  Widget build(BuildContext context) {
    // A signal bump that we increment to force a reload.
    final reload = useSignal(0);

    final sectionsSignal = useFutureSignal(
      () => client.admin.listSections(),
      keys: [reload.value],
    );

    final sections = sectionsSignal.watch(context);

    void refresh() => reload.value++;

    Future<void> deleteSection(Section s) async {
      final confirmed = await _showConfirmDialog(
        context,
        title: 'Delete Section',
        message: 'Delete "${s.name}"? This cannot be undone.',
      );
      if (!confirmed || !context.mounted) return;
      final messenger = ScaffoldMessenger.of(context);
      try {
        await client.admin.deleteSection(s.id!);
        messenger.showSnackBar(SnackBar(
          content: Text('"${s.name}" deleted.'),
          backgroundColor: const Color(0xFF4ECDC4),
        ));
        refresh();
      } catch (e) {
        messenger.showSnackBar(SnackBar(
          content: Text('Error: $e'),
          backgroundColor: Colors.red[700],
        ));
      }
    }

    void openDialog({Section? existing}) {
      showDialog(
        context: context,
        builder: (_) => _SectionDialog(section: existing, onSaved: refresh),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFF0F1117),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF6C63FF),
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('New Section'),
        onPressed: () => openDialog(),
      ),
      body: sections.map(
        data: (list) {
          if (list.isEmpty) {
            return const Center(
              child: Text('No sections yet. Create one!',
                  style: TextStyle(color: Colors.white54)),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 100),
            itemCount: list.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (_, i) => _SectionCard(
              section: list[i],
              onEdit: () => openDialog(existing: list[i]),
              onDelete: () => deleteSection(list[i]),
            ),
          );
        },
        error: (e, _) => Center(
          child: Text('Error: $e',
              style: const TextStyle(color: Colors.redAccent)),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(color: Color(0xFF6C63FF)),
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.section,
    required this.onEdit,
    required this.onDelete,
  });

  final Section section;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1D27),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withAlpha(15)),
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF6C63FF), Color(0xFF4ECDC4)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.terrain, color: Colors.white, size: 20),
        ),
        title: Text(section.name,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 15)),
        subtitle: Text(section.description,
            style: const TextStyle(color: Colors.white54, fontSize: 12),
            maxLines: 2,
            overflow: TextOverflow.ellipsis),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                icon: const Icon(Icons.edit_outlined, color: Colors.white54),
                tooltip: 'Edit',
                onPressed: onEdit),
            IconButton(
                icon: Icon(Icons.delete_outline, color: Colors.red[300]),
                tooltip: 'Delete',
                onPressed: onDelete),
          ],
        ),
      ),
    );
  }
}

/// Create / Edit section dialog — pure HookWidget, no StatefulWidget needed.
class _SectionDialog extends HookWidget {
  const _SectionDialog({this.section, required this.onSaved});

  final Section? section;
  final VoidCallback onSaved;

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final nameCtrl =
        useTextEditingController(text: section?.name ?? '');
    final descCtrl =
        useTextEditingController(text: section?.description ?? '');
    final locationCtrl =
        useTextEditingController(text: section?.location ?? '');
    final contactCtrl =
        useTextEditingController(text: section?.contactInfo ?? '');
    final saving = useSignal(false);

    final isEdit = section != null;

    Future<void> save() async {
      if (!formKey.currentState!.validate()) return;
      saving.value = true;

      final s = Section(
        id: section?.id,
        name: nameCtrl.text.trim(),
        description: descCtrl.text.trim(),
        location:
            locationCtrl.text.trim().isEmpty ? null : locationCtrl.text.trim(),
        contactInfo:
            contactCtrl.text.trim().isEmpty ? null : contactCtrl.text.trim(),
      );

      try {
        if (isEdit) {
          await client.admin.updateSection(s);
        } else {
          await client.admin.createSection(s);
        }
        if (context.mounted) {
          Navigator.pop(context);
          onSaved();
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('Save failed: $e'),
                backgroundColor: Colors.red[700]),
          );
        }
      } finally {
        saving.value = false;
      }
    }

    return Watch((context) {
      final isSaving = saving.value;
      return AlertDialog(
        backgroundColor: const Color(0xFF1A1D27),
        title: Text(
          isEdit ? 'Edit Section' : 'New Section',
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700),
        ),
        content: SizedBox(
          width: 400,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _field('Name', nameCtrl, required: true),
                const SizedBox(height: 12),
                _field('Description', descCtrl, required: true, maxLines: 2),
                const SizedBox(height: 12),
                _field('Location (optional)', locationCtrl),
                const SizedBox(height: 12),
                _field('Contact Info (optional)', contactCtrl),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: isSaving ? null : () => Navigator.pop(context),
            child: const Text('Cancel',
                style: TextStyle(color: Colors.white54)),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF6C63FF)),
            onPressed: isSaving ? null : save,
            child: isSaving
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                        color: Colors.white, strokeWidth: 2))
                : Text(isEdit ? 'Update' : 'Create'),
          ),
        ],
      );
    });
  }

  Widget _field(
    String label,
    TextEditingController ctrl, {
    bool required = false,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: ctrl,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white54),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withAlpha(30)),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF6C63FF)),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        filled: true,
        fillColor: const Color(0xFF0F1117),
      ),
      validator: required
          ? (v) => (v == null || v.trim().isEmpty) ? 'Required' : null
          : null,
    );
  }
}

// ---------------------------------------------------------------------------
// Members Tab
// ---------------------------------------------------------------------------

class _MembersTab extends HookWidget {
  const _MembersTab();

  @override
  Widget build(BuildContext context) {
    final searchCtrl = useTextEditingController();
    final filter = useSignal<String?>(null);
    final reload = useSignal(0);

    // Pagination state
    final items = useSignal<List<Member>>([]);
    final offset = useSignal(0);
    final hasMore = useSignal(true);
    final isLoading = useSignal(false);
    final error = useSignal<String?>(null);

    const int pageSize = 50;

    Future<void> fetchPage({bool reset = false}) async {
      if (isLoading.peek() || (!hasMore.peek() && !reset)) return;

      isLoading.value = true;
      error.value = null;

      if (reset) {
        offset.value = 0;
        hasMore.value = true;
      }

      try {
        final newItems = await client.member.getSectionMembers(
          filter: filter.peek(),
          limit: pageSize,
          offset: offset.peek(),
        );

        if (reset) {
          items.value = newItems;
        } else {
          items.value = [...items.peek(), ...newItems];
        }

        hasMore.value = newItems.length == pageSize;
        offset.value = offset.peek() + newItems.length;
      } catch (e) {
        error.value = e.toString();
      } finally {
        isLoading.value = false;
      }
    }

    // Handle filter and reload changes (reset state)
    useEffect(() {
      void onChanged() {
        final text = searchCtrl.text.trim();
        filter.value = text.isEmpty ? null : text;
      }

      searchCtrl.addListener(onChanged);
      return () => searchCtrl.removeListener(onChanged);
    }, [searchCtrl]);

    // Re-fetch on filter or reload change
    useEffect(() {
      fetchPage(reset: true);
      return null;
    }, [filter.value, reload.value]);

    final scrollController = useScrollController();
    useEffect(() {
      void onScroll() {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 200) {
          fetchPage();
        }
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController]);

    Future<void> deleteUser(Member member) async {
      final fullName =
          member.displayName ?? '${member.firstName} ${member.lastName}';
      final confirmed = await _showConfirmDialog(
        context,
        title: 'Delete Member',
        message:
            'Permanently delete "$fullName"? This will remove all their data and cannot be undone.',
      );
      if (!confirmed || !context.mounted) return;
      final messenger = ScaffoldMessenger.of(context);
      try {
        await client.admin.deleteUser(member.id!);
        messenger.showSnackBar(SnackBar(
          content: Text('"$fullName" deleted.'),
          backgroundColor: const Color(0xFF4ECDC4),
        ));
        reload.value++;
      } catch (e) {
        messenger.showSnackBar(SnackBar(
          content: Text('Error: $e'),
          backgroundColor: Colors.red[700],
        ));
      }
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: TextField(
            controller: searchCtrl,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Search by name or email…',
              hintStyle: const TextStyle(color: Colors.white38),
              prefixIcon: const Icon(Icons.search, color: Colors.white38),
              filled: true,
              fillColor: const Color(0xFF1A1D27),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white.withAlpha(20)),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF6C63FF)),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ),
        Expanded(
          child: Watch((context) {
            final list = items.value;
            final isInitialLoading = isLoading.value && list.isEmpty;
            final currentError = error.value;

            if (isInitialLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Color(0xFF6C63FF)),
              );
            }

            if (currentError != null && list.isEmpty) {
              return Center(
                child: Text('Error: $currentError',
                    style: const TextStyle(color: Colors.redAccent)),
              );
            }

            if (list.isEmpty) {
              return const Center(
                child: Text('No members found.',
                    style: TextStyle(color: Colors.white54)),
              );
            }

            return ListView.separated(
              controller: scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: list.length + (hasMore.value ? 1 : 0),
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (_, i) {
                if (i == list.length) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(
                      child: CircularProgressIndicator(
                          color: Color(0xFF6C63FF), strokeWidth: 2),
                    ),
                  );
                }
                return _MemberCard(
                  member: list[i],
                  onDelete: () => deleteUser(list[i]),
                );
              },
            );
          }),
        ),
      ],
    );
  }
}

class _MemberCard extends StatelessWidget {
  const _MemberCard({required this.member, required this.onDelete});

  final Member member;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final fullName =
        member.displayName ?? '${member.firstName} ${member.lastName}';
    final initials = fullName
        .trim()
        .split(' ')
        .where((p) => p.isNotEmpty)
        .map((p) => p[0].toUpperCase())
        .take(2)
        .join();

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1D27),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withAlpha(15)),
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF6C63FF).withAlpha(180),
          child: Text(initials,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 14)),
        ),
        title: Text(fullName,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14)),
        subtitle: Text(member.email,
            style: const TextStyle(color: Colors.white54, fontSize: 12)),
        trailing: IconButton(
          icon: Icon(Icons.delete_outline, color: Colors.red[300]),
          tooltip: 'Delete member',
          onPressed: onDelete,
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Shared utilities
// ---------------------------------------------------------------------------

Future<bool> _showConfirmDialog(
  BuildContext context, {
  required String title,
  required String message,
}) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      backgroundColor: const Color(0xFF1A1D27),
      title: Text(title,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700)),
      content:
          Text(message, style: const TextStyle(color: Colors.white70)),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx, false),
          child: const Text('Cancel',
              style: TextStyle(color: Colors.white54)),
        ),
        FilledButton(
          style:
              FilledButton.styleFrom(backgroundColor: Colors.red[700]),
          onPressed: () => Navigator.pop(ctx, true),
          child: const Text('Delete'),
        ),
      ],
    ),
  );
  return result ?? false;
}
