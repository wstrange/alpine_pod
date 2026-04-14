import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:signals_flutter/signals_flutter.dart';
import '../signals.dart';

class NotificationScreen extends HookWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationsState = notificationsSignal.watch(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'DEBUG: Add Notification',
            onPressed: () async {
              await client.notification.createTestNotification();
              notificationsSignal.refresh();
            },
          ),
          if (notificationsState.value != null && notificationsState.value!.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.done_all),
              tooltip: 'Mark all as read',
              onPressed: () async {
                final unread = notificationsState.value!.where((n) => !n.read).toList();
                for (var n in unread) {
                  await client.notification.markAsRead(n.id!);
                }
                notificationsSignal.refresh();
              },
            ),
        ],
      ),
      body: notificationsState.map(
        data: (notifications) {
          if (notifications.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.notifications_none, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('No notifications yet', style: TextStyle(color: Colors.grey)),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async => notificationsSignal.refresh(),
            child: ListView.separated(
              itemCount: notifications.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return Dismissible(
                  key: Key('notif_${notification.id}'),
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) async {
                    await client.notification.deleteNotification(notification.id!);
                    notificationsSignal.refresh();
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: notification.read ? Colors.grey[200] : Colors.blue[100],
                      child: Icon(
                        notification.read ? Icons.notifications_none : Icons.notifications_active,
                        color: notification.read ? Colors.grey : Colors.blue,
                      ),
                    ),
                    title: Text(
                      notification.title,
                      style: TextStyle(
                        fontWeight: notification.read ? FontWeight.normal : FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(notification.message),
                        const SizedBox(height: 4),
                        Text(
                          notification.timestamp.toLocal().toString().split('.')[0],
                          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    trailing: !notification.read
                        ? IconButton(
                            icon: const Icon(Icons.mark_chat_read_outlined, size: 20),
                            onPressed: () async {
                              await client.notification.markAsRead(notification.id!);
                              notificationsSignal.refresh();
                            },
                          )
                        : null,
                    onTap: () async {
                      if (!notification.read) {
                        await client.notification.markAsRead(notification.id!);
                        notificationsSignal.refresh();
                      }
                      
                      if (context.mounted && notification.eventId != null) {
                        context.push('/event-view/${notification.eventId}');
                      }
                    },
                  ),
                );
              },
            ),
          );
        },
        error: (error, _) => Center(child: Text('Error: $error')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
