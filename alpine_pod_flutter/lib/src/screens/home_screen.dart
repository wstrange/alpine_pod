import 'package:alpine_pod_flutter/main.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Section Name'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                sessionManager.signOutDevice();
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 10, // Mock data
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Upcoming Event ${index + 1}'),
            subtitle: const Text('Event details...'),
            onTap: () {
              // Navigate to event details screen
            },
          );
        },
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}