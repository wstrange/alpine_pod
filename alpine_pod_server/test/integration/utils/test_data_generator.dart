import 'package:serverpod/serverpod.dart';
import '../../../lib/src/generated/protocol.dart';
import 'package:faker/faker.dart';

/// Utility class for generating test data
class TestDataGenerator {
  final Session session;
  final faker = Faker();

  TestDataGenerator(this.session);

  /// Generates a random user with the specified role
  Future<User> createUser({UserRole? role}) async {
    final now = DateTime.now();
    final user = User(
      name: faker.person.name(),
      email: faker.internet.email(),
      role: role ?? UserRole.member,
      password: faker.internet.password(),
      phoneNumber: faker.phoneNumber.us(),
      membershipStatus: 'active',
      emergencyContactName: faker.person.name(),
      emergencyContactPhone: faker.phoneNumber.us(),
      createdAt: now,
    );
    return await User.db.insertRow(session, user);
  }

  /// Generates multiple users with specified roles
  Future<List<User>> createUsers({
    int adminCount = 1,
    int sectionManagerCount = 2,
    int tripLeaderCount = 5,
    int memberCount = 20,
    int guestCount = 10,
  }) async {
    final users = <User>[];

    // Create users for each role
    for (var i = 0; i < adminCount; i++) {
      users.add(await createUser(role: UserRole.admin));
    }
    for (var i = 0; i < sectionManagerCount; i++) {
      users.add(await createUser(role: UserRole.sectionManager));
    }
    for (var i = 0; i < tripLeaderCount; i++) {
      users.add(await createUser(role: UserRole.tripLeader));
    }
    for (var i = 0; i < memberCount; i++) {
      users.add(await createUser(role: UserRole.member));
    }
    for (var i = 0; i < guestCount; i++) {
      users.add(await createUser(role: UserRole.guest));
    }

    return users;
  }

  /// Creates a section with optional manager assignments
  Future<Section> createSection({List<User>? managers}) async {
    final section = Section(
      name: '${faker.address.state()} Chapter',
      description: faker.lorem.sentences(2).join(' '),
      location: faker.address.city(),
      contactInfo: faker.internet.email(),
    );
    final createdSection = await Section.db.insertRow(session, section);

    // Assign section managers if provided
    if (managers != null) {
      for (final manager in managers) {
        await SectionMembership.db.insertRow(
          session,
          SectionMembership(
            userId: manager.id,
            sectionId: createdSection.id,
            syncedAt: DateTime.now(),
          ),
        );
      }
    }

    return createdSection;
  }

  /// Creates multiple sections with managers
  Future<List<Section>> createSections({
    int count = 3,
    List<User>? managers,
  }) async {
    final sections = <Section>[];
    for (var i = 0; i < count; i++) {
      sections.add(await createSection(managers: managers));
    }
    return sections;
  }

  /// Creates an event with optional trip leaders
  Future<Event> createEvent({
    required Section section,
    List<User>? tripLeaders,
    DateTime? startTime,
    bool requiresApproval = false,
    bool waitlistEnabled = true,
    int? maxParticipants,
  }) async {
    final eventStart = startTime ?? DateTime.now().add(Duration(days: faker.randomGenerator.integer(30, min: 7)));

    final event = Event(
      title: '${faker.sport.name()} Event',
      description: faker.lorem.sentences(3).join(' '),
      type: EventType.values[faker.randomGenerator.integer(EventType.values.length)],
      location: faker.address.streetAddress(),
      sectionId: section.id,
      startTime: eventStart,
      endTime: eventStart.add(Duration(hours: faker.randomGenerator.integer(8, min: 2))),
      registrationStartDate: eventStart.subtract(Duration(days: faker.randomGenerator.integer(30, min: 14))),
      registrationDeadline: eventStart.subtract(Duration(days: faker.randomGenerator.integer(3, min: 1))),
      public: faker.randomGenerator.boolean(),
      requiresApproval: requiresApproval,
      waitlistEnabled: waitlistEnabled,
      waiverRequired: true,
      maxParticipants: maxParticipants ?? faker.randomGenerator.integer(30, min: 5),
    );

    final createdEvent = await Event.db.insertRow(session, event);

    // Assign trip leaders if provided
    if (tripLeaders != null) {
      for (final leader in tripLeaders) {
        await EventTripLeader.db.insertRow(
          session,
          EventTripLeader(
            eventId: createdEvent.id,
            userId: leader.id,
            assignedAt: DateTime.now(),
          ),
        );
      }
    }

    return createdEvent;
  }

  /// Creates multiple events for each section
  Future<List<Event>> createEvents({
    required List<Section> sections,
    List<User>? tripLeaders,
    int eventsPerSection = 3,
  }) async {
    final events = <Event>[];
    for (final section in sections) {
      for (var i = 0; i < eventsPerSection; i++) {
        events.add(await createEvent(
          section: section,
          tripLeaders: tripLeaders,
        ));
      }
    }
    return events;
  }

  /// Creates registrations for an event
  Future<List<EventRegistration>> createRegistrations({
    required Event event,
    required List<User> users,
    double registeredPercent = 0.7,
    double approvedPercent = 0.8,
    double waitlistedPercent = 0.2,
  }) async {
    final registrations = <EventRegistration>[];
    final registeredCount = (users.length * registeredPercent).round();
    final approvedCount = (registeredCount * approvedPercent).round();
    final waitlistedCount = (registeredCount * waitlistedPercent).round();

    for (var i = 0; i < registeredCount; i++) {
      final user = users[i];
      RegistrationStatus status;
      int? waitlistPosition;

      if (i < approvedCount) {
        status = RegistrationStatus.confirmed;
      } else if (i < approvedCount + waitlistedCount) {
        status = RegistrationStatus.waitlisted;
        waitlistPosition = i - approvedCount + 1;
      } else {
        status = RegistrationStatus.pending;
      }

      // Null safety check
      final eventId = event.id;
      final userId = user.id;
      if (eventId == null || userId == null) {
        throw Exception('Event or User ID is null');
      }

      final registration = EventRegistration(
        eventId: eventId,
        userId: userId,
        registrationStatus: status,
        registrationDate: DateTime.now().subtract(Duration(days: faker.randomGenerator.integer(10))),
        waiverAccepted: true,
        participantNotes: faker.lorem.sentence(),
        waitlistPosition: waitlistPosition,
        waitlistedAt: waitlistPosition != null ? DateTime.now() : null,
        modifiedAt: DateTime.now(),
        additionalGuests: 0,
        paymentStatus: 'N/A',
        paymentAmount: 0,
        noShow: false,
      );

      registrations.add(await EventRegistration.db.insertRow(session, registration));
    }

    return registrations;
  }
}
