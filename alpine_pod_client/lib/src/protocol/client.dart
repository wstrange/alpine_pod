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
import 'package:alpine_pod_client/src/protocol/event.dart' as _i3;
import 'package:alpine_pod_client/src/protocol/event_registration.dart' as _i4;
import 'package:alpine_pod_client/src/protocol/registration_status.dart' as _i5;
import 'package:alpine_pod_client/src/protocol/event_trip_leader.dart' as _i6;
import 'package:alpine_pod_client/src/protocol/user.dart' as _i7;
import 'package:alpine_pod_client/src/protocol/section_membership.dart' as _i8;
import 'package:alpine_pod_client/src/protocol/greeting.dart' as _i9;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i10;
import 'protocol.dart' as _i11;

/// {@category Endpoint}
class EndpointEvent extends _i1.EndpointRef {
  EndpointEvent(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'event';

  _i2.Future<_i3.Event> createEvent(_i3.Event event) =>
      caller.callServerEndpoint<_i3.Event>(
        'event',
        'createEvent',
        {'event': event},
      );

  _i2.Future<_i3.Event?> getEvent(int id) =>
      caller.callServerEndpoint<_i3.Event?>(
        'event',
        'getEvent',
        {'id': id},
      );

  _i2.Future<_i3.Event> updateEvent(_i3.Event event) =>
      caller.callServerEndpoint<_i3.Event>(
        'event',
        'updateEvent',
        {'event': event},
      );

  _i2.Future<void> deleteEvent(int id) => caller.callServerEndpoint<void>(
        'event',
        'deleteEvent',
        {'id': id},
      );

  _i2.Future<List<_i3.Event>> listEvents(int? sectionId) =>
      caller.callServerEndpoint<List<_i3.Event>>(
        'event',
        'listEvents',
        {'sectionId': sectionId},
      );
}

/// {@category Endpoint}
class EndpointRegistration extends _i1.EndpointRef {
  EndpointRegistration(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'registration';

  /// Approve or reject a registration
  _i2.Future<_i4.EventRegistration> updateRegistrationStatus(
    int registrationId,
    _i5.RegistrationStatus newStatus, {
    String? notes,
  }) =>
      caller.callServerEndpoint<_i4.EventRegistration>(
        'registration',
        'updateRegistrationStatus',
        {
          'registrationId': registrationId,
          'newStatus': newStatus,
          'notes': notes,
        },
      );

  _i2.Future<_i4.EventRegistration> registerForEvent(
          _i4.EventRegistration registration) =>
      caller.callServerEndpoint<_i4.EventRegistration>(
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
class EndpointTripLeader extends _i1.EndpointRef {
  EndpointTripLeader(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'tripLeader';

  _i2.Future<_i6.EventTripLeader> assignTripLeader(
          _i6.EventTripLeader tripLeader) =>
      caller.callServerEndpoint<_i6.EventTripLeader>(
        'tripLeader',
        'assignTripLeader',
        {'tripLeader': tripLeader},
      );

  _i2.Future<void> removeTripLeader(_i6.EventTripLeader tripLeader) =>
      caller.callServerEndpoint<void>(
        'tripLeader',
        'removeTripLeader',
        {'tripLeader': tripLeader},
      );

  _i2.Future<List<_i6.EventTripLeader>> listEventTripLeaders(int eventId) =>
      caller.callServerEndpoint<List<_i6.EventTripLeader>>(
        'tripLeader',
        'listEventTripLeaders',
        {'eventId': eventId},
      );

  _i2.Future<List<_i3.Event>> listTripLeaderEvents(int userId) =>
      caller.callServerEndpoint<List<_i3.Event>>(
        'tripLeader',
        'listTripLeaderEvents',
        {'userId': userId},
      );

  /// List events in a section that have no trip leaders assigned
  _i2.Future<List<_i3.Event>> listEventsWithoutTripLeader(int sectionId) =>
      caller.callServerEndpoint<List<_i3.Event>>(
        'tripLeader',
        'listEventsWithoutTripLeader',
        {'sectionId': sectionId},
      );

  /// List all trip leaders for events in a section
  _i2.Future<List<_i6.EventTripLeader>> listSectionTripLeaders(int sectionId) =>
      caller.callServerEndpoint<List<_i6.EventTripLeader>>(
        'tripLeader',
        'listSectionTripLeaders',
        {'sectionId': sectionId},
      );
}

/// {@category Endpoint}
class EndpointUser extends _i1.EndpointRef {
  EndpointUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'user';

  _i2.Future<_i7.User> updateUserRole(_i7.User user) =>
      caller.callServerEndpoint<_i7.User>(
        'user',
        'updateUserRole',
        {'user': user},
      );

  _i2.Future<_i8.SectionMembership> addUserToSection(
          _i8.SectionMembership membership) =>
      caller.callServerEndpoint<_i8.SectionMembership>(
        'user',
        'addUserToSection',
        {'membership': membership},
      );

  _i2.Future<void> removeUserFromSection(_i8.SectionMembership membership) =>
      caller.callServerEndpoint<void>(
        'user',
        'removeUserFromSection',
        {'membership': membership},
      );

  _i2.Future<void> syncSectionMembership(
          List<_i8.SectionMembership> memberships) =>
      caller.callServerEndpoint<void>(
        'user',
        'syncSectionMembership',
        {'memberships': memberships},
      );
}

/// This is an example endpoint that returns a greeting message through
/// its [hello] method.
/// {@category Endpoint}
class EndpointGreeting extends _i1.EndpointRef {
  EndpointGreeting(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'greeting';

  /// Returns a personalized greeting message: "Hello {name}".
  _i2.Future<_i9.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i9.Greeting>(
        'greeting',
        'hello',
        {'name': name},
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
    event = EndpointEvent(this);
    registration = EndpointRegistration(this);
    tripLeader = EndpointTripLeader(this);
    user = EndpointUser(this);
    greeting = EndpointGreeting(this);
    modules = Modules(this);
  }

  late final EndpointEvent event;

  late final EndpointRegistration registration;

  late final EndpointTripLeader tripLeader;

  late final EndpointUser user;

  late final EndpointGreeting greeting;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'event': event,
        'registration': registration,
        'tripLeader': tripLeader,
        'user': user,
        'greeting': greeting,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
