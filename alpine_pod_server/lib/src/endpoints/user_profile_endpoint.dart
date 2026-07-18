import 'dart:typed_data';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import '../generated/protocol.dart';

/// Endpoint to view and edit the signed-in user's profile.
class UserProfileEndpoint extends UserProfileEditBaseEndpoint {
  @override
  Future<UserProfileModel> setUserImage(
    final Session session,
    final ByteData image,
  ) async {
    final authUserId = session.authenticated?.authUserId;
    if (authUserId == null) {
      throw Exception('User not authenticated');
    }

    // Check if the user profile exists
    final profile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.authUserId.equals(authUserId),
    );

    if (profile == null) {
      // Fetch details from Member table if possible
      final member = await Member.db.findFirstRow(
        session,
        where: (t) => t.userId.equals(authUserId),
      );

      String? email = member?.email;
      String? userName = member?.displayName;

      if (email == null) {
        // Fallback to EmailAccount
        final emailAccount = await EmailAccount.db.findFirstRow(
          session,
          where: (t) => t.authUserId.equals(authUserId),
        );
        email = emailAccount?.email;
      }

      await AuthServices.instance.userProfiles.createUserProfile(
        session,
        authUserId,
        UserProfileData(
          email: email ?? 'user@example.com',
          userName: userName ?? 'User',
        ),
      );
    }

    return super.setUserImage(session, image);
  }
}

