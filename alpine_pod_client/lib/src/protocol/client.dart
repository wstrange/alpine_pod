/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:alpine_pod_client/src/protocol/section.dart' as _i3;
import 'package:alpine_pod_client/src/protocol/event.dart' as _i4;
import 'package:alpine_pod_client/src/protocol/member.dart' as _i5;
import 'package:alpine_pod_client/src/protocol/section_membership.dart' as _i6;
import 'package:alpine_pod_client/src/protocol/event_registration.dart' as _i7;
import 'package:alpine_pod_client/src/protocol/registration_status.dart' as _i8;
import 'package:alpine_pod_client/src/protocol/event_trip_leader.dart' as _i9;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i10;
import 'protocol.dart' as _i11;

/// {@category Endpoint}
class EndpointAdmin extends _i1.EndpointRef {
  EndpointAdmin(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'admin';

  /// Section Management
  _i2.Future<_i3.Section> createSection(_i3.Section section) =>
      caller.callServerEndpoint<_i3.Section>(
        'admin',
        'createSection',
        {'section': section},
      );

  _i2.Future<_i3.Section?> getSection(int id) =>
      caller.callServerEndpoint<_i3.Section?>(
        'admin',
        'getSection',
        {'id': id},
      );

  _i2.Future<_i3.Section> updateSection(_i3.Section section) =>
      caller.callServerEndpoint<_i3.Section>(
        'admin',
        'updateSection',
        {'section': section},
      );

  _i2.Future<void> deleteSection(int id) => caller.callServerEndpoint<void>(
        'admin',
        'deleteSection',
        {'id': id},
      );

  _i2.Future<List<_i3.Section>> listSections() =>
      caller.callServerEndpoint<List<_i3.Section>>(
        'admin',
        'listSections',
        {},
      );
}

/// {@category Endpoint}
class EndpointEvent extends _i1.EndpointRef {
  EndpointEvent(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'event';

  _i2.Future<_i4.Event> createEvent(_i4.Event event) =>
      caller.callServerEndpoint<_i4.Event>(
        'event',
        'createEvent',
        {'event': event},
      );

  _i2.Future<_i4.Event?> getEvent(int id) =>
      caller.callServerEndpoint<_i4.Event?>(
        'event',
        'getEvent',
        {'id': id},
      );

  _i2.Future<_i4.Event> updateEvent(_i4.Event event) =>
      caller.callServerEndpoint<_i4.Event>(
        'event',
        'updateEvent',
        {'event': event},
      );

  _i2.Future<void> deleteEvent(int id) => caller.callServerEndpoint<void>(
        'event',
        'deleteEvent',
        {'id': id},
      );

  _i2.Future<List<_i4.Event>> listEvents(int? sectionId) =>
      caller.callServerEndpoint<List<_i4.Event>>(
        'event',
        'listEvents',
        {'sectionId': sectionId},
      );
}

/// TODO: Use RBAC to restrict access to these methods
///
///
/// {@category Endpoint}
class EndpointMember extends _i1.EndpointRef {
  EndpointMember(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'member';

  _i2.Future<_i5.Member?> getCurrentMember() =>
      caller.callServerEndpoint<_i5.Member?>(
        'member',
        'getCurrentMember',
        {},
      );

  _i2.Future<List<_i5.Member>> getMembers() =>
      caller.callServerEndpoint<List<_i5.Member>>(
        'member',
        'getMembers',
        {},
      );

  /// Create a new member.
  ///
  /// - Validates that the email is not already in use.
  /// - Sets `createdAt` to now.
  /// - Inserts the member row and invalidates the member cache.
  _i2.Future<_i5.Member> createMember(_i5.Member member) =>
      caller.callServerEndpoint<_i5.Member>(
        'member',
        'createMember',
        {'member': member},
      );

  _i2.Future<_i6.SectionMembership> addMemberToSection(
          _i6.SectionMembership membership) =>
      caller.callServerEndpoint<_i6.SectionMembership>(
        'member',
        'addMemberToSection',
        {'membership': membership},
      );

  _i2.Future<void> removeMemberFromSection(_i6.SectionMembership membership) =>
      caller.callServerEndpoint<void>(
        'member',
        'removeMemberFromSection',
        {'membership': membership},
      );

  _i2.Future<_i5.Member> updateMember(_i5.Member member) =>
      caller.callServerEndpoint<_i5.Member>(
        'member',
        'updateMember',
        {'member': member},
      );
}

/// {@category Endpoint}
class EndpointRegistration extends _i1.EndpointRef {
  EndpointRegistration(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'registration';

  /// Approve or reject a registration
  _i2.Future<_i7.EventRegistration> updateRegistrationStatus(
    int registrationId,
    _i8.RegistrationStatus newStatus, {
    String? notes,
  }) =>
      caller.callServerEndpoint<_i7.EventRegistration>(
        'registration',
        'updateRegistrationStatus',
        {
          'registrationId': registrationId,
          'newStatus': newStatus,
          'notes': notes,
        },
      );

  _i2.Future<_i7.EventRegistration> registerForEvent(
          _i7.EventRegistration registration) =>
      caller.callServerEndpoint<_i7.EventRegistration>(
        'registration',
        'registerForEvent',
        {'registration': registration},
      );

  _i2.Future<void> cancelRegistration(int registrationId) =>
      caller.callServerEndpoint<void>(
        'registration',
        'cancelRegistration',
        {'registrationId': registrationId},
      );
}

/// {@category Endpoint}
class EndpointSection extends _i1.EndpointRef {
  EndpointSection(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'section';

  _i2.Future<_i3.Section?> getSection(int id) =>
      caller.callServerEndpoint<_i3.Section?>(
        'section',
        'getSection',
        {'id': id},
      );

  _i2.Future<List<_i3.Section>> listSections() =>
      caller.callServerEndpoint<List<_i3.Section>>(
        'section',
        'listSections',
        {},
      );

  _i2.Future<List<_i3.Section>> getSectionsForCurrentUser() =>
      caller.callServerEndpoint<List<_i3.Section>>(
        'section',
        'getSectionsForCurrentUser',
        {},
      );
}

/// {@category Endpoint}
class EndpointTripLeader extends _i1.EndpointRef {
  EndpointTripLeader(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'tripLeader';

  _i2.Future<_i9.EventTripLeader> assignTripLeader(
          _i9.EventTripLeader tripLeader) =>
      caller.callServerEndpoint<_i9.EventTripLeader>(
        'tripLeader',
        'assignTripLeader',
        {'tripLeader': tripLeader},
      );

  _i2.Future<void> removeTripLeader(_i9.EventTripLeader tripLeader) =>
      caller.callServerEndpoint<void>(
        'tripLeader',
        'removeTripLeader',
        {'tripLeader': tripLeader},
      );

  _i2.Future<List<_i9.EventTripLeader>> listEventTripLeaders(int eventId) =>
      caller.callServerEndpoint<List<_i9.EventTripLeader>>(
        'tripLeader',
        'listEventTripLeaders',
        {'eventId': eventId},
      );

  _i2.Future<List<_i4.Event>> listTripLeaderEvents(int memberId) =>
      caller.callServerEndpoint<List<_i4.Event>>(
        'tripLeader',
        'listTripLeaderEvents',
        {'memberId': memberId},
      );

  /// List events in a section that have no trip leaders assigned
  _i2.Future<List<_i4.Event>> listEventsWithoutTripLeader(int sectionId) =>
      caller.callServerEndpoint<List<_i4.Event>>(
        'tripLeader',
        'listEventsWithoutTripLeader',
        {'sectionId': sectionId},
      );

  /// List all trip leaders for events in a section
  _i2.Future<List<_i9.EventTripLeader>> listSectionTripLeaders(int sectionId) =>
      caller.callServerEndpoint<List<_i9.EventTripLeader>>(
        'tripLeader',
        'listSectionTripLeaders',
        {'sectionId': sectionId},
      );
}

class Modules {
  Modules(Client client) {
    auth = _i10.Caller(client);
  }

  late final _i10.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i11.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    admin = EndpointAdmin(this);
    event = EndpointEvent(this);
    member = EndpointMember(this);
    registration = EndpointRegistration(this);
    section = EndpointSection(this);
    tripLeader = EndpointTripLeader(this);
    modules = Modules(this);
  }

  late final EndpointAdmin admin;

  late final EndpointEvent event;

  late final EndpointMember member;

  late final EndpointRegistration registration;

  late final EndpointSection section;

  late final EndpointTripLeader tripLeader;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'admin': admin,
        'event': event,
        'member': member,
        'registration': registration,
        'section': section,
        'tripLeader': tripLeader,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
