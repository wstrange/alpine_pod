import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';

class UserListWidget extends StatelessWidget {
  final List<Member> members;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  const UserListWidget({
    super.key,
    required this.members,
    this.shrinkWrap = false,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    if (members.isEmpty) {
      return const Center(child: Text('No members found.'));
    }

    return ListView.separated(
      shrinkWrap: shrinkWrap,
      physics: physics,
      itemCount: members.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final member = members[index];
        final name =
            member.displayName ?? '${member.firstName} ${member.lastName}';

        return ListTile(
          leading: CircleAvatar(
            backgroundImage: member.profilePictureUrl != null
                ? NetworkImage(member.profilePictureUrl!)
                : null,
            child: member.profilePictureUrl == null
                ? Text(name.isNotEmpty ? name[0].toUpperCase() : '?')
                : null,
          ),
          title: Text(name),
          subtitle: Text(member.email),
          onTap: () => _showMemberDetails(context, member),
        );
      },
    );
  }

  void _showMemberDetails(BuildContext context, Member member) {
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
                        backgroundImage:
                            NetworkImage(member.profilePictureUrl!),
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
}
