
import 'package:flutter/material.dart';

import '../widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Section Name'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Open navigation drawer
          },
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
