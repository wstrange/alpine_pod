import 'package:flutter/material.dart';
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
        final notificationsState = notificationStreamSignal.value;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Notifications'),
            actions: [
              IconButton(icon: const Icon(Icons.home_outlined), tooltip: 'Home', onPressed: () => context.go('/')),
              IconButton(
                icon: const Icon(Icons.settings_outlined),
                tooltip: 'Preferences',
                onPressed: () {
                  showDialog(context: context, builder: (context) => const NotificationPreferencesDialog());
                },
              ),
              if (notificationsState.value != null && notificationsState.value!.isNotEmpty)
                IconButton(
                  icon: const Icon(Icons.done_all),
                  tooltip: 'Mark all as read',
                  onPressed: () async {
                    final unread = notificationsState.value!.where((n) => !n.isRead).toList();
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
                    final un = notifications[index];
                    final url = un.notification?.actionUrl ?? '/notifications';

                    return Dismissible(
                      key: Key('notif_${un.id}'),
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) async {
                        await client.notification.markAsRead(un.id!);
                        notificationsSignal.refresh();
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: un.isRead ? Colors.grey[200] : Colors.blue[100],
                          child: Icon(
                            un.isRead ? Icons.notifications_none : Icons.notifications_active,
                            color: un.isRead ? Colors.grey : Colors.blue,
                          ),
                        ),
                        title: Text(
                          un.notification?.renderedTitle ?? 'No Title',
                          style: TextStyle(fontWeight: un.isRead ? FontWeight.normal : FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(un.notification?.renderedBody ?? 'No Body'),
                            const SizedBox(height: 4),
                            Text(
                              un.createdAt.toLocal().toString().split('.')[0],
                              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                            ),
                          ],
                        ),
                        trailing: un.isRead
                            ? IconButton(
                                icon: const Icon(Icons.mark_chat_read_outlined, size: 20),
                                onPressed: () async {
                                  final id = un.id;
                                  if (id != null) {
                                    await client.notification.markAsRead(id);
                                  }
                                  notificationsSignal.refresh();
                                },
                              )
                            : null,
                        onTap: () async {
                          if (!un.isRead) {
                            await client.notification.markAsRead(un.id!);
                            notificationsSignal.refresh();
                          }

                          if (context.mounted) {
                            context.go(url);
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
      },
    );
  }
}
