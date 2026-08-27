import 'dart:async';

import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:signals_hooks/signals_hooks.dart';

import '../repositories/member_repository.dart';
import '../signals.dart';
import '../widgets/member_directory_list_widget.dart';

class MemberDirectoryScreen extends HookWidget {
  const MemberDirectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchCtrl = useTextEditingController();
    final filter = useSignal<String?>(null);
    final reload = useSignal(0);

    // Pagination state
    final memberships = useSignal<List<SectionMembership>>([]);
    final offset = useSignal(0);
    final hasMore = useSignal(true);
    final isLoading = useSignal(false);
    final error = useSignal<String?>(null);

    const int pageSize = 50;

    final section = sectionSignal.value;
    final isOnline = isOnlineSignal.value;

    Future<void> fetchPage({bool reset = false}) async {
      final sectionId = section?.id;
      if (sectionId == null) {
        memberships.value = [];
        return;
      }

      if (isLoading.peek() || (!hasMore.peek() && !reset)) return;

      isLoading.value = true;
      error.value = null;

      if (reset) {
        offset.value = 0;
        hasMore.value = true;
      }

      try {
        final newItems = await memberRepository.getSectionMemberships(
          sectionId: sectionId,
          filter: filter.peek(),
          limit: pageSize,
          offset: offset.peek(),
        );

        if (reset) {
          memberships.value = newItems;
        } else {
          memberships.value = [...memberships.peek(), ...newItems];
        }

        hasMore.value = newItems.length == pageSize;
        offset.value = offset.peek() + newItems.length;
      } catch (e) {
        error.value = e.toString();
      } finally {
        isLoading.value = false;
      }
    }

    // Debounced search
    useEffect(() {
      Timer? timer;
      void onChanged() {
        timer?.cancel();
        timer = Timer(const Duration(milliseconds: 500), () {
          final text = searchCtrl.text.trim();
          filter.value = text.isEmpty ? null : text;
        });
      }

      searchCtrl.addListener(onChanged);
      return () {
        searchCtrl.removeListener(onChanged);
        timer?.cancel();
      };
    }, [searchCtrl]);

    // Re-fetch on filter, reload, section change, or online status change
    useEffect(() {
      fetchPage(reset: true);
      return null;
    }, [filter.value, reload.value, section?.id, isOnline]);

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

    Future<void> updateScopes(UuidValue memberId, Set<String> newScopes) async {
      final sectionId = section?.id;
      if (sectionId == null) return;

      final messenger = ScaffoldMessenger.of(context);
      if (!isOnlineSignal.value) {
        messenger.showSnackBar(
          const SnackBar(
            content: Text('Cannot update roles while offline.'),
            backgroundColor: Colors.orange,
          ),
        );
        return;
      }

      try {
        await client.member.updateMemberScopes(memberId, sectionId, newScopes);
        messenger.showSnackBar(
          const SnackBar(content: Text('Roles updated successfully')),
        );
        reload.value++; // Reload to show changes
      } catch (e) {
        messenger.showSnackBar(
          SnackBar(content: Text('Failed to update roles: $e')),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Member Directory')),
      body: Column(
        children: [
          if (!isOnline)
            Container(
              width: double.infinity,
              color: Colors.amber.shade100,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                children: [
                  Icon(Icons.cloud_off, size: 18, color: Colors.amber.shade900),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Offline Mode: Viewing cached member directory. Role updates are disabled.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.amber.shade900,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchCtrl,
              decoration: const InputDecoration(
                labelText: 'Search',
                hintText: 'Name or Email',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: SignalBuilder(
              builder: (context) {
                final list = memberships.value;
                final isInitialLoading = isLoading.value && list.isEmpty;

                if (isInitialLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                final currentError = error.value;
                if (currentError != null && list.isEmpty) {
                  return Center(child: Text('Error: $currentError'));
                }

                return MemberDirectoryListWidget(
                  memberships: list,
                  hasMore: hasMore.value,
                  isLoadingMore: isLoading.value && list.isNotEmpty,
                  scrollController: scrollController,
                  onScopesUpdated: updateScopes,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
