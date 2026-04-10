import 'dart:async';

import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:signals_hooks/signals_hooks.dart';
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

    final section = sectionSignal.watch(context);

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
        final newItems = await client.member.getSectionMemberships(
          sectionId,
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

    // Re-fetch on filter, reload or section change
    useEffect(() {
      fetchPage(reset: true);
      return null;
    }, [filter.value, reload.value, section?.id]);

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

    Future<void> updateScopes(int memberId, Set<String> newScopes) async {
      final sectionId = section?.id;
      if (sectionId == null) return;

      final messenger = ScaffoldMessenger.of(context);
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
      appBar: AppBar(
        title: const Text('Member Directory'),
      ),
      body: Column(
        children: [
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
            child: Watch((context) {
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
            }),
          ),
        ],
      ),
    );
  }
}
