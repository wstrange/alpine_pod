import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';
import 'member_details_dialog.dart';

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
          onTap: () => showMemberDetailsDialog(context, member),
        );
      },
    );
  }
}

