import 'dart:async';

import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';
import '../signals.dart';
import '../widgets/member_directory_list_widget.dart';

class MemberDirectoryScreen extends StatefulWidget {
  const MemberDirectoryScreen({super.key});

  @override
  State<MemberDirectoryScreen> createState() => _MemberDirectoryScreenState();
}

class _MemberDirectoryScreenState extends State<MemberDirectoryScreen> {
  final _searchController = TextEditingController();
  Timer? _debounceTimer;

  late Future<List<SectionMembership>> _membershipsFuture;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    // Initial load
    _loadMembers();
  }

  void _onSearchChanged() {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      _loadMembers(filter: _searchController.text);
    });
  }

  void _loadMembers({String? filter}) {
    if (!mounted) return;

    final sectionId = sectionSignal.peek()?.id;
    if (sectionId == null) {
      setState(() {
        _membershipsFuture = Future.value([]);
      });
      return;
    }

    setState(() {
      _membershipsFuture =
          client.member.getSectionMemberships(sectionId, filter: filter);
    });
  }

  Future<void> _updateScopes(int memberId, Set<String> newScopes) async {
    final sectionId = sectionSignal.peek()?.id;
    if (sectionId == null) return;

    try {
      await client.member.updateMemberScopes(memberId, sectionId, newScopes);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Roles updated successfully')),
        );
        _loadMembers(filter: _searchController.text); // Reload to show changes
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update roles: $e')),
        );
      }
    }
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Member Directory'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search',
                hintText: 'Name or Email',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<SectionMembership>>(
              future: _membershipsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                final memberships = snapshot.data ?? [];

                if (memberships.isEmpty) {
                  return const Center(child: Text('No members found.'));
                }

                return MemberDirectoryListWidget(
                  memberships: memberships,
                  onScopesUpdated: _updateScopes,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
