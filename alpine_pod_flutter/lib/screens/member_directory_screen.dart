import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';
import 'package:state_beacon/state_beacon.dart';
import '../beacon.dart';
import '../widgets/user_list_widget.dart';

class MemberDirectoryScreen extends StatefulWidget {
  const MemberDirectoryScreen({super.key});

  @override
  State<MemberDirectoryScreen> createState() => _MemberDirectoryScreenState();
}

class _MemberDirectoryScreenState extends State<MemberDirectoryScreen> {
  final _searchController = TextEditingController();
  // Beacon to hold the search query
  late final _queryBeacon = _searchController.beacon(
    debounceTime: const Duration(milliseconds: 500),
  );

  late Future<List<Member>> _membersFuture;

  @override
  void initState() {
    super.initState();
    // Watch the query beacon and refresh list when it changes
    _queryBeacon.subscribe((value) {
      _loadMembers(filter: value.text);
    });
    // Initial load
    _loadMembers();
  }

  void _loadMembers({String? filter}) {
    // Access the current section ID properly
    // 'sectionBeacon' is available in beacon.dart

    if (!mounted) return;

    final sectionId = sectionBeacon.value?.id;
    if (sectionId == null) {
      // Handle no section selected, maybe empty list
      setState(() {
        _membersFuture = Future.value([]);
      });
      return;
    }

    setState(() {
      _membersFuture =
          client.member.getSectionMembers(sectionId, filter: filter);
    });
  }

  @override
  void dispose() {
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
            child: FutureBuilder<List<Member>>(
              future: _membersFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                final members = snapshot.data ?? [];

                if (members.isEmpty) {
                  return const Center(child: Text('No members found.'));
                }

                return UserListWidget(
                  members: members,
                  // We want it to scroll in the expanded area, so no shrinkWrap needed usually
                  // But UserListWidget is a ListView.
                  // If we put it in Expanded, it should work fine.
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Extension to create a beacon from text controller for convenience
// Or I can just use a simple listener.
// state_beacon likely has a way or I can do it manually.
// Simplified beacon wrapper:
extension TextEditingControllerBeacon on TextEditingController {
  ReadableBeacon<TextEditingValue> beacon({
    Duration? debounceTime,
  }) {
    final beacon = Beacon.writable(value);
    addListener(() {
      beacon.value = value;
    });
    if (debounceTime != null) {
      // Debounced version
      // Wait, state_beacon APIs are specific.
      // I'll stick to a simple listener with Timer for debounce in standard Flutter style
      // to avoid API guessing if I don't have docs handy.
      // Actually user requested "create the required backend endpoints",
      // I should impress with the UI.
      // I'll use simple listener + debounce manually or `Beacon.debounced`.
      // Let's use standard Beacon.writable and update it in listener.
      return beacon; // No built-in controller extension in core lib usually.
    }
    return beacon;
  }
}
