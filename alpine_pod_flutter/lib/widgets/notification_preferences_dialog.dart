import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
import '../signals.dart';

class NotificationPreferencesDialog extends StatelessWidget {
  const NotificationPreferencesDialog({super.key});

  String _getTypeTitle(String type) {
    switch (type) {
      case 'event-created':
        return 'New Event Announcements';
      case 'event-cancelled':
        return 'Cancelled Events';
      case 'add-to-waitlist':
        return 'Waitlist Updates';
      case 'registration-cancelled':
        return 'Registration Cancellations';
      case 'registration-approved':
        return 'Registration Approvals';
      case 'event-registered':
        return 'New Registrations (For Managers)';
      default:
        return type;
    }
  }

  String _getTypeDescription(String type) {
    switch (type) {
      case 'event-created':
        return 'When a new event is posted in your sections';
      case 'event-cancelled':
        return 'When an event you are attending is cancelled';
      case 'add-to-waitlist':
        return 'When you are placed on a waitlist';
      case 'registration-cancelled':
        return 'When your registration is cancelled';
      case 'registration-approved':
        return 'When your registration is confirmed';
      case 'event-registered':
        return 'When a member registers for an event you manage';
      default:
        return 'Configure your notification channels';
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      Text(
                        'Notification Preferences',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Choose how you want to be notified',
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),
            Flexible(
              child: SingleChildScrollView(
                child: SignalBuilder(
                  builder: (context) {
                    final prefsValue = notificationPreferencesSignal.value;

                    return prefsValue.map(
                      data: (prefs) {
                        if (prefs.isEmpty) {
                          return const Center(child: Text('No preferences available'));
                        }

                        return Column(
                          children: prefs.map((pref) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _getTypeTitle(pref.notificationType),
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    _getTypeDescription(pref.notificationType),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    children: [
                                      _PreferenceChip(
                                        label: 'Email',
                                        icon: Icons.email_outlined,
                                        selected: pref.allowEmail,
                                        onChanged: (val) async {
                                          final updated = pref.copyWith(allowEmail: val);
                                          await client.notification.savePreference(updated);
                                          notificationPreferencesSignal.refresh();
                                        },
                                      ),
                                      _PreferenceChip(
                                        label: 'In-App',
                                        icon: Icons.phonelink_ring_outlined,
                                        selected: pref.allowInApp,
                                        onChanged: (val) async {
                                          final updated = pref.copyWith(allowInApp: val);
                                          await client.notification.savePreference(updated);
                                          notificationPreferencesSignal.refresh();
                                        },
                                      ),
                                      _PreferenceChip(
                                        label: 'Push',
                                        icon: Icons.notifications_active_outlined,
                                        selected: pref.allowPush,
                                        onChanged: (val) async {
                                          final updated = pref.copyWith(allowPush: val);
                                          await client.notification.savePreference(updated);
                                          notificationPreferencesSignal.refresh();
                                        },
                                      ),
                                      _PreferenceChip(
                                        label: 'SMS',
                                        icon: Icons.sms_outlined,
                                        selected: pref.allowSms,
                                        onChanged: (val) async {
                                          final updated = pref.copyWith(allowSms: val);
                                          await client.notification.savePreference(updated);
                                          notificationPreferencesSignal.refresh();
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  const Divider(height: 1),
                                ],
                              ),
                            );
                          }).toList(),
                        );
                      },
                      error: (err, _) => Center(child: Text('Error: $err')),
                      loading: () => const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 24),
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PreferenceChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final ValueChanged<bool> onChanged;

  const _PreferenceChip({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FilterChip(
      avatar: Icon(
        icon,
        size: 16,
        color: selected ? Colors.white : theme.colorScheme.primary,
      ),
      label: Text(label),
      selected: selected,
      onSelected: onChanged,
      selectedColor: theme.colorScheme.primary,
      checkmarkColor: Colors.white,
      labelStyle: TextStyle(
        fontSize: 12,
        color: selected ? Colors.white : Colors.black87,
        fontWeight: selected ? FontWeight.bold : FontWeight.normal,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: selected ? Colors.transparent : Colors.grey.shade300,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
    );
  }
}
