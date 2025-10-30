// /test/integration/utils/gen_data.dart
//
// Utility to generate sample entity objects for tests using faker.
// Adjust field names/types to match your generated protocol classes if they differ.

import 'dart:math';

import 'package:faker/faker.dart';
import 'package:alpine_pod_server/src/generated/protocol.dart';

class GenData {
  final Faker faker;
  final Random _rnd;

  GenData({Faker? faker, Random? random})
      : faker = faker ?? Faker(),
        _rnd = random ?? Random();

  // Example generator for a Member entity.
  //
  // NOTE: Update the named parameters / field names if your generated Member
  // class uses different fields.
  Member member({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? displayName,
    String? bio,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    final f = faker;
    final fn = firstName ?? f.person.firstName();
    final ln = lastName ?? f.person.lastName();
    return Member(
      membershipStatus: 'active',
      phoneNumber: f.phoneNumber.us(),
      emergencyContactName: f.person.name(),
      emergencyContactPhone: f.phoneNumber.us(),
      medicalConditions: f.lorem.sentence(),
      id: id ?? _rnd.nextInt(100000),
      firstName: fn,
      lastName: ln,
      email: email ?? f.internet.email(),
      displayName: displayName ?? '$fn $ln',
      bio: bio ?? f.lorem.sentence(),
      createdAt: createdAt ?? DateTime.now().subtract(Duration(days: _rnd.nextInt(365))),
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }

  // Example generator for a Section entity.
  //
  // NOTE: Update the named parameters / field names if your generated Section
  // class uses different fields.
  Section section({
    int? id,
    String? title,
    String? description,
    String? slug,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    final f = faker;
    //final t = title ?? f.lorem.words(2).join(' ');
    return Section(
      name: 'Calgary',
      // id: id ?? _rnd.nextInt(100000),
      description: description ?? f.lorem.sentences(2).join(' '),
    );
  }

  // Helpers to produce lists
  List<Member> members(int count) => List.generate(count, (_) => member());
  List<Section> sections(int count) => List.generate(count, (_) => section());

  // Simple slug generator
}
