import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';

/// Shows a dialog with the member's details.
/// [extraActions] can be used to add buttons like "Edit Roles".
void showMemberDetailsDialog(BuildContext context, Member member,
    {List<Widget>? extraActions}) {
  final name = member.displayName ?? '${member.firstName} ${member.lastName}';

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(name),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (member.profilePictureUrl != null)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(member.profilePictureUrl!),
                    ),
                  ),
                ),
              _buildDetailRow(Icons.email, 'Email', member.email),
              _buildDetailRow(Icons.phone, 'Phone', member.phoneNumber),
              if (member.bio != null && member.bio!.isNotEmpty)
                _buildDetailRow(Icons.info, 'Bio', member.bio!),
              const Divider(),
              const Text('Emergency Contact',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              _buildDetailRow(
                  Icons.person, 'Name', member.emergencyContactName),
              _buildDetailRow(
                  Icons.phone, 'Phone', member.emergencyContactPhone),
            ],
          ),
        ),
        actions: [
          ...?extraActions,
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}

Widget _buildDetailRow(IconData icon, String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Colors.grey[600]),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              Text(
                value,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
