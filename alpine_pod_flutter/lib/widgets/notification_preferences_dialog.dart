import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../signals.dart';

class NotificationPreferencesDialog extends HookWidget {
  const NotificationPreferencesDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final snapshot = useFuture(useMemoized(() => client.notification.getMyPreferences()));
    final prefsState = useState<UserNotificationPreference?>(null);

    useEffect(() {
      if (snapshot.hasData) {
        prefsState.value = snapshot.data;
      }
      return null;
    }, [snapshot.data]);

    if (snapshot.hasError) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 48),
              const SizedBox(height: 16),
              Text('Error loading preferences: ${snapshot.error}'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'),
              ),
            ],
          ),
        ),
      );
    }

    final prefs = prefsState.value;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Container(
        padding: const EdgeInsets.all(24),
        constraints: const BoxConstraints(maxWidth: 500),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue.shade50,
                  child: Icon(Icons.settings_suggest, color: Colors.blue.shade700),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Notification Preferences', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('Choose how you want to be notified', style: TextStyle(fontSize: 13, color: Colors.grey)),
                    ],
                  ),
                ),
                IconButton(onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.close)),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),
            if (prefs == null)
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: CircularProgressIndicator(),
                ),
              )
            else
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Notification Channels',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      // Note: In app is always enabled.
                      // _PreferenceSwitchTile(
                      //   title: 'In-App Notifications',
                      //   subtitle: 'Receive notifications directly in the application',
                      //   icon: Icons.phonelink_ring_outlined,
                      //   value: prefs.allowInApp,
                      //   onChanged: (val) async {
                      //     final updated = prefs.copyWith(allowInApp: val);
                      //     prefsState.value = updated;
                      //     await client.notification.savePreference(updated);
                      //   },
                      // ),
                      _PreferenceSwitchTile(
                        title: 'Email Notifications',
                        subtitle: 'Receive updates via email',
                        icon: Icons.email_outlined,
                        value: prefs.allowEmail,
                        onChanged: (val) async {
                          final updated = prefs.copyWith(allowEmail: val);
                          prefsState.value = updated;
                          await client.notification.savePreference(updated);
                        },
                      ),
                      _PreferenceSwitchTile(
                        title: 'Push Notifications',
                        subtitle: 'Receive push notifications on your device',
                        icon: Icons.notifications_active_outlined,
                        value: prefs.allowPush,
                        onChanged: (val) async {
                          final updated = prefs.copyWith(allowPush: val);
                          prefsState.value = updated;
                          await client.notification.savePreference(updated);
                        },
                      ),
                      _PreferenceSwitchTile(
                        title: 'SMS Notifications',
                        subtitle: 'Receive text message notifications',
                        icon: Icons.sms_outlined,
                        value: prefs.allowSms,
                        onChanged: (val) async {
                          final updated = prefs.copyWith(allowSms: val);
                          prefsState.value = updated;
                          await client.notification.savePreference(updated);
                        },
                      ),
                      const SizedBox(height: 16),
                      const Divider(),
                      const SizedBox(height: 16),
                      const Text(
                        'Subscriptions',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      _PreferenceSwitchTile(
                        title: 'New Events',
                        subtitle: 'Get notified when new events are posted in your sections',
                        icon: Icons.event,
                        value: prefs.newEvents,
                        onChanged: (val) async {
                          final updated = prefs.copyWith(newEvents: val);
                          prefsState.value = updated;
                          await client.notification.savePreference(updated);
                        },
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _PreferenceSwitchTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _PreferenceSwitchTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      contentPadding: EdgeInsets.zero,
      secondary: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      value: value,
      onChanged: onChanged,
    );
  }
}
