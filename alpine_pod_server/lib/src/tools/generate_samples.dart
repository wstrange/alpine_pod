import 'package:alpine_pod_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import '../custom_scopes.dart';

class GenerateUsers {
  GenerateUsers(this.session) {
    setup();
  };

  final Session session;

  final now = DateTime.now().toUtc();

  setup() async {

  }

  Future<int> generateUsers() async {}

  Future<void> createAdmin() async {
    final now = DateTime.now().toUtc();
    final emailIdp = AuthServices.instance.emailIdp;
    final admin = emailIdp.admin;

  var auModel = await AuthServices.instance.authUsers.create(session, scopes: {Scope.admin, CustomScope.admin});
  // await enableAllNotificationsForUser(session, auModel.id);

  final emailAccountId = await admin.createEmailAuthentication(
    session,
    authUserId: auModel.id,
    email: 'admin@acc.ca',
    password: 'Passw0rd',
  );

  print('Created Admin: $emailAccountId');

  // Create a Member profile for the admin user
  final adminMember = await Member.db.insertRow(
    session,
    Member(
      firstName: 'Admin',
      lastName: 'User',
      displayName: 'Admin User',
      email: 'admin@acc.ca',
      phoneNumber: '555-0000',
      emergencyContactName: 'Emergency Contact',
      emergencyContactPhone: '555-0001',
      id: auModel.id,
    ),
  );
  print('Created Admin Member profile: $adminMember');

  // Add admin to the National section
  final sections = await endpoints.admin.listSections(authSession);
  final national = sections.firstWhere((s) => s.name == 'National');

  await endpoints.member.addMemberToSection(
    authSession,
    SectionMembership(
      memberId: adminMember.id,
      sectionId: national.id!,
      scopes: {CustomScope.sectionManager.name!, CustomScope.member.name!},
    ),
  );
  print('Added Admin to National section');
}

Future<void> upsertMember(Session session, Member member) async {
  final existing = await Member.db.findFirstRow(session, where: (t) => t.id.equals(member.id));

  if (existing != null) {
    await Member.db.updateRow(session, member.copyWith(id: existing.id));
  } else {
    await Member.db.insertRow(session, member);
  }
}

Future<void> upsertSectionMembership(Session session, SectionMembership membership) async {
  final existing = await SectionMembership.db.findFirstRow(session, where: (t) => t.id.equals(membership.id));

  if (existing != null) {
    await SectionMembership.db.updateRow(session, membership.copyWith(id: existing.id));
  } else {
    await SectionMembership.db.insertRow(session, membership);
  }
}

Future<void> upsertAuthUser(Session session, AuthUser user) async {
  final existing = await AuthUser.db.findFirstRow(session, where: (t) => t.id.equals(user.id));

  if (existing != null) {
    await AuthUser.db.updateRow(session, user.copyWith(id: existing.id));
  } else {
    await AuthUser.db.insertRow(session, user);
  }
}

Future<int> generateEvents(Session session) async {}
