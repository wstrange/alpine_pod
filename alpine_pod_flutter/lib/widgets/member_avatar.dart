import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:material_ui/material_ui.dart';

class const MemberAvatar({
  super.key,
  required this.member,
  this.radius = 20,
  this.initialsStyle,
}) extends StatelessWidget {
  final Member member;
  final double radius;
  final TextStyle? initialsStyle;

  @override
  Widget build(BuildContext context) {
    final name = member.displayName ?? '${member.firstName} ${member.lastName}';
    final fallback = Text(
      name.isNotEmpty ? name[0].toUpperCase() : '?',
      style: initialsStyle,
    );

    return CircleAvatar(
      radius: radius,
      backgroundImage: member.profileImageUrl != null
          ? NetworkImage(member.profileImageUrl!)
          : null,
      child: member.profileImageUrl == null ? fallback : null,
    );
  }
}
