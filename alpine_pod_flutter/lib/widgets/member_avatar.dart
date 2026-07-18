import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';

import '../signals.dart';

class MemberAvatar extends StatelessWidget {
  final Member? member;
  final double radius;
  final TextStyle? initialsStyle;

  const MemberAvatar({
    super.key,
    required this.member,
    this.radius = 20,
    this.initialsStyle,
  });

  @override
  Widget build(BuildContext context) {
    final member = this.member;
    final name = member == null
        ? ''
        : member.displayName ?? '${member.firstName} ${member.lastName}';
    final fallback = Text(
      name.isNotEmpty ? name[0].toUpperCase() : '?',
      style: initialsStyle,
    );

    if (member?.id == null) {
      return CircleAvatar(radius: radius, child: fallback);
    }

    return FutureBuilder<String?>(
      future: client.member.getMemberProfileImageUrl(member!.id!),
      builder: (context, snapshot) {
        final imageUrl = snapshot.data;
        return CircleAvatar(
          radius: radius,
          backgroundImage: imageUrl != null ? NetworkImage(imageUrl) : null,
          child: imageUrl == null ? fallback : null,
        );
      },
    );
  }
}
