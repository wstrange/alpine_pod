import 'dart:math';

import 'package:faker/faker.dart';
import 'package:alpine_pod_server/src/generated/protocol.dart';

class EntityGenerator {
  final Faker faker;
  final Random _rnd;

  EntityGenerator({Faker? faker, Random? random})
      : faker = faker ?? Faker(),
        _rnd = random ?? Random();

  Member generateMember({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? phoneNumber,
    String? membershipStatus,
    String? profilePictureUrl,
    String? emergencyContactName,
    String? emergencyContactPhone,
    String? medicalConditions,
    String? certifications,
    MemberRole? role,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    final f = faker;
    final fn = firstName ?? f.person.firstName();
    final ln = lastName ?? f.person.lastName();
    return Member(
      //id: id ?? _rnd.nextInt(100000),
      firstName: fn,
      lastName: ln,
      email: email ?? f.internet.email(),
      password: password ?? f.internet.password(),
      phoneNumber: phoneNumber ?? f.phoneNumber.us(),
      membershipStatus: membershipStatus ?? 'active',
      profilePictureUrl: profilePictureUrl ?? f.internet.httpsUrl(),
      emergencyContactName: emergencyContactName ?? f.person.name(),
      emergencyContactPhone: emergencyContactPhone ?? f.phoneNumber.us(),
      medicalConditions: medicalConditions ?? f.lorem.sentence(),
      certifications: certifications ?? f.lorem.word(),
      role: role ?? MemberRole.member,
      createdAt: createdAt ?? DateTime.now().subtract(Duration(days: _rnd.nextInt(365))),
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }

  Section generateSection({
    int? id,
    String? name,
    String? description,
    String? location,
    String? contactInfo,
  }) {
    final f = faker;
    final n = name ?? f.lorem.words(2).join(' ');
    return Section(
      id: id ?? _rnd.nextInt(100000),
      name: n,
      description: description ?? f.lorem.sentences(2).join(' '),
      location: location ?? f.address.city(),
      contactInfo: contactInfo ?? f.internet.email(),
    );
  }

  List<Member> generateMembers(int count) => List.generate(count, (_) => generateMember());
  List<Section> generateSections(int count) => List.generate(count, (_) => generateSection());
}
