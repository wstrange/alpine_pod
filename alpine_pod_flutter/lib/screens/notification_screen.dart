import 'package:material_ui/material_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../signals.dart';
import '../widgets/notification_preferences_dialog.dart';

class NotificationScreen extends HookWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SignalBuilder(
      builder: (context) {
        final notificationsState = notificationsSignal.value;
        bool hasNotifications =
            notificationsState.value != null &&
            notificationsState.value!.isNotEmpty;

        final isOnline = isOnlineSignal.value;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Notifications'),
            actions: [
              IconButton(
                icon: const Icon(Icons.home_outlined),
                tooltip: 'Home',
                onPressed: () => context.go('/'),
              ),
              IconButton(
                icon: const Icon(Icons.settings_outlined),
                tooltip: isOnline ? 'Preferences' : 'Preferences (Offline)',
                onPressed: isOnline
                    ? () {
                        showDialog(
                          context: context,
                          builder: (context) =>
                              const NotificationPreferencesDialog(),
                        );
                      }
                    : null,
              ),
              IconButton(
                icon: const Icon(Icons.refresh),
                tooltip: 'Refresh',
                onPressed: () => notificationsSignal.refresh(),
              ),
              if (hasNotifications)
                IconButton(
                  icon: const Icon(Icons.done_all),
                  tooltip: isOnline
                      ? 'Mark all as read'
                      : 'Mark all as read (Offline)',
                  onPressed: isOnline
                      ? () async {
                          final unread = notificationsState.value!
                              .where((n) => !n.isRead)
                              .toList();
                          for (var n in unread) {
                            await client.notification.markAsRead(n.id);
                          }
                          notificationsSignal.refresh();
                        }
                      : null,
                ),
              if (hasNotifications)
                IconButton(
                  icon: const Icon(Icons.clear_all),
                  tooltip: isOnline
                      ? 'Delete all notifications'
                      : 'Delete all (Offline)',
                  onPressed: isOnline
                      ? () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Delete all notifications'),
                              content: const Text(
                                'Are you sure you want to delete all notifications?',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => context.pop(),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    await client.notification.deleteAll();
                                    notificationsSignal.refresh();
                                    if (context.mounted) context.pop();
                                  },
                                  child: const Text('Delete'),
                                ),
                              ],
                            ),
                          );
                        }
                      : null,
                ),
            ],
          ),
          body: Column(
            children: [
              if (!isOnline)
                Container(
                  width: double.infinity,
                  color: Colors.amber.shade100,
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.cloud_off,
                        size: 18,
                        color: Colors.amber.shade900,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Offline Mode: Viewing cached notifications. Actions disabled.',
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
              Expanded(
                child: notificationsState.map(
                  data: (notifications) {
                    if (notifications.isEmpty) {
                      return const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.notifications_none,
                              size: 64,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'No notifications yet',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      );
                    }

                    return RefreshIndicator(
                      onRefresh: () async => notificationsSignal.refresh(),
                      child: ListView.separated(
                        itemCount: notifications.length,
                        separatorBuilder: (context, index) =>
                            const Divider(height: 1),
                        itemBuilder: (context, index) {
                          final un = notifications[index];
                          final url = un.notification?.actionUrl;

                          final tile = ListTile(
                            leading: CircleAvatar(
                              backgroundColor: un.isRead
                                  ? Colors.grey[200]
                                  : Colors.blue[100],
                              child: Icon(
                                un.isRead
                                    ? Icons.notifications_none
                                    : Icons.notifications_active,
                                color: un.isRead ? Colors.grey : Colors.blue,
                              ),
                            ),
                            title: Text(
                              un.notification?.renderedTitle ?? 'No Title',
                              style: TextStyle(
                                fontWeight: un.isRead
                                    ? FontWeight.normal
                                    : FontWeight.bold,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  un.notification?.renderedBody ?? 'No Body',
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  un.createdAt.toLocal().toString().split(
                                    '.',
                                  )[0],
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                            trailing: url != null
                                ? IconButton(
                                    icon: const Icon(
                                      Icons.open_in_new,
                                      size: 20,
                                    ),
                                    onPressed: () async {
                                      final url = un.notification?.actionUrl;
                                      if (url != null && context.mounted) {
                                        context.push(url);
                                      }
                                    },
                                  )
                                : const SizedBox.shrink(),
                            onTap: () async {
                              if (!isOnline) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'You are currently offline. Cannot update notification status.',
                                    ),
                                  ),
                                );
                                return;
                              }
                              if (!un.isRead) {
                                await client.notification.markAsRead(un.id);
                                notificationsSignal.refresh();
                              }
                            },
                          );

                          if (!isOnline) {
                            return tile;
                          }

                          return Dismissible(
                            key: Key('notif_${un.id}'),
                            background: Container(
                              color: Colors.red,
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 20),
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) async {
                              await client.notification.markAsRead(un.id);
                              notificationsSignal.refresh();
                            },
                            child: tile,
                          );
                        },
                      ),
                    );
                  },
                  error: (error, _) => Center(child: Text('Error: $error')),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
