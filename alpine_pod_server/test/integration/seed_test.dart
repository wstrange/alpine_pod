// @Timeout(Duration(seconds: 60))
// @Tags(['integration'])

import 'package:alpine_pod_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';
import 'test_tools/serverpod_test_tools.dart';

import 'utils/gen_data.dart';

final genData = GenData();

void main() {
  const id = 1;

  withServerpod('Seed Data', (sessionBuilder, endpoints) {
    var authSession = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(id, {Scope.admin}), enableLogging: true);

    test('cleanSections ', () async {
      // Assuming member with id=1 is an admin in the test setup
      final members = await endpoints.section.listSections(authSession);
      for (var section in members) {
        print('deleting section: $section');
        //await endpoints.section.deleteSection(authSession, section.id!);
      }
      final postDeleteMembers = await endpoints.section.listSections(authSession);
      expect(postDeleteMembers.length, equals(0));
    }, skip: false);

    test('Create Default Sections', () async {
      var s1 = Section(
        name: 'Calgary',
        description: 'Calgary Section',
        location: 'Room 101',
        contactInfo: '55-121`23456',
      );
      final sections = await endpoints.section.createSection(authSession, s1);
      expect(sections, isNotNull);
      expect(sections, isA<Section>());
      print(sections);

      var id = sections.id!;
      final s3 = await endpoints.section.getSection(authSession, id);

      // try to insert a dupe

      try {
        await endpoints.section.createSection(authSession, s3!);
        fail('Expected exception for duplicate section creation');
      } catch (e) {
        expect(e, isA<Exception>());
      }

      print(s3);
    });

    // We want to keep the data after tests run
  }, rollbackDatabase: RollbackDatabase.disabled, applyMigrations: false, enableSessionLogging: true);
}
