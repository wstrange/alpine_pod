/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/admin_endpoint.dart' as _i2;
import '../endpoints/event_endpoint.dart' as _i3;
import '../endpoints/member_endpoint.dart' as _i4;
import '../endpoints/registration_endpoint.dart' as _i5;
import '../endpoints/section_endpoint.dart' as _i6;
import '../endpoints/trip_leader_endpoint.dart' as _i7;
import 'package:alpine_pod_server/src/generated/section.dart' as _i8;
import 'package:alpine_pod_server/src/generated/event.dart' as _i9;
import 'package:alpine_pod_server/src/generated/member.dart' as _i10;
import 'package:alpine_pod_server/src/generated/section_membership.dart'
    as _i11;
import 'package:alpine_pod_server/src/generated/registration_status.dart'
    as _i12;
import 'package:alpine_pod_server/src/generated/event_registration.dart'
    as _i13;
import 'package:alpine_pod_server/src/generated/event_trip_leader.dart' as _i14;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i15;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'admin': _i2.AdminEndpoint()
        ..initialize(
          server,
          'admin',
          null,
        ),
      'event': _i3.EventEndpoint()
        ..initialize(
          server,
          'event',
          null,
        ),
      'member': _i4.MemberEndpoint()
        ..initialize(
          server,
          'member',
          null,
        ),
      'registration': _i5.RegistrationEndpoint()
        ..initialize(
          server,
          'registration',
          null,
        ),
      'section': _i6.SectionEndpoint()
        ..initialize(
          server,
          'section',
          null,
        ),
      'tripLeader': _i7.TripLeaderEndpoint()
        ..initialize(
          server,
          'tripLeader',
          null,
        ),
    };
    connectors['admin'] = _i1.EndpointConnector(
      name: 'admin',
      endpoint: endpoints['admin']!,
      methodConnectors: {
        'createSection': _i1.MethodConnector(
          name: 'createSection',
          params: {
            'section': _i1.ParameterDescription(
              name: 'section',
              type: _i1.getType<_i8.Section>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['admin'] as _i2.AdminEndpoint).createSection(
                    session,
                    params['section'],
                  ),
        ),
        'getSection': _i1.MethodConnector(
          name: 'getSection',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['admin'] as _i2.AdminEndpoint).getSection(
                session,
                params['id'],
              ),
        ),
        'updateSection': _i1.MethodConnector(
          name: 'updateSection',
          params: {
            'section': _i1.ParameterDescription(
              name: 'section',
              type: _i1.getType<_i8.Section>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['admin'] as _i2.AdminEndpoint).updateSection(
                    session,
                    params['section'],
                  ),
        ),
        'deleteSection': _i1.MethodConnector(
          name: 'deleteSection',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['admin'] as _i2.AdminEndpoint).deleteSection(
                    session,
                    params['id'],
                  ),
        ),
        'listSections': _i1.MethodConnector(
          name: 'listSections',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['admin'] as _i2.AdminEndpoint).listSections(
                session,
              ),
        ),
      },
    );
    connectors['event'] = _i1.EndpointConnector(
      name: 'event',
      endpoint: endpoints['event']!,
      methodConnectors: {
        'createEvent': _i1.MethodConnector(
          name: 'createEvent',
          params: {
            'event': _i1.ParameterDescription(
              name: 'event',
              type: _i1.getType<_i9.Event>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['event'] as _i3.EventEndpoint).createEvent(
                session,
                params['event'],
              ),
        ),
        'getEvent': _i1.MethodConnector(
          name: 'getEvent',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['event'] as _i3.EventEndpoint).getEvent(
                session,
                params['id'],
              ),
        ),
        'updateEvent': _i1.MethodConnector(
          name: 'updateEvent',
          params: {
            'event': _i1.ParameterDescription(
              name: 'event',
              type: _i1.getType<_i9.Event>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['event'] as _i3.EventEndpoint).updateEvent(
                session,
                params['event'],
              ),
        ),
        'deleteEvent': _i1.MethodConnector(
          name: 'deleteEvent',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['event'] as _i3.EventEndpoint).deleteEvent(
                session,
                params['id'],
              ),
        ),
        'listEvents': _i1.MethodConnector(
          name: 'listEvents',
          params: {
            'sectionId': _i1.ParameterDescription(
              name: 'sectionId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['event'] as _i3.EventEndpoint).listEvents(
                session,
                params['sectionId'],
              ),
        ),
      },
    );
    connectors['member'] = _i1.EndpointConnector(
      name: 'member',
      endpoint: endpoints['member']!,
      methodConnectors: {
        'getCurrentMember': _i1.MethodConnector(
          name: 'getCurrentMember',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['member'] as _i4.MemberEndpoint)
                  .getCurrentMember(session),
        ),
        'getMembers': _i1.MethodConnector(
          name: 'getMembers',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['member'] as _i4.MemberEndpoint).getMembers(
                session,
              ),
        ),
        'createMember': _i1.MethodConnector(
          name: 'createMember',
          params: {
            'member': _i1.ParameterDescription(
              name: 'member',
              type: _i1.getType<_i10.Member>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['member'] as _i4.MemberEndpoint).createMember(
                    session,
                    params['member'],
                  ),
        ),
        'addMemberToSection': _i1.MethodConnector(
          name: 'addMemberToSection',
          params: {
            'membership': _i1.ParameterDescription(
              name: 'membership',
              type: _i1.getType<_i11.SectionMembership>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['member'] as _i4.MemberEndpoint)
                  .addMemberToSection(
                    session,
                    params['membership'],
                  ),
        ),
        'removeMemberFromSection': _i1.MethodConnector(
          name: 'removeMemberFromSection',
          params: {
            'membership': _i1.ParameterDescription(
              name: 'membership',
              type: _i1.getType<_i11.SectionMembership>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['member'] as _i4.MemberEndpoint)
                  .removeMemberFromSection(
                    session,
                    params['membership'],
                  ),
        ),
        'updateMember': _i1.MethodConnector(
          name: 'updateMember',
          params: {
            'member': _i1.ParameterDescription(
              name: 'member',
              type: _i1.getType<_i10.Member>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['member'] as _i4.MemberEndpoint).updateMember(
                    session,
                    params['member'],
                  ),
        ),
      },
    );
    connectors['registration'] = _i1.EndpointConnector(
      name: 'registration',
      endpoint: endpoints['registration']!,
      methodConnectors: {
        'updateRegistrationStatus': _i1.MethodConnector(
          name: 'updateRegistrationStatus',
          params: {
            'registrationId': _i1.ParameterDescription(
              name: 'registrationId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'newStatus': _i1.ParameterDescription(
              name: 'newStatus',
              type: _i1.getType<_i12.RegistrationStatus>(),
              nullable: false,
            ),
            'notes': _i1.ParameterDescription(
              name: 'notes',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['registration'] as _i5.RegistrationEndpoint)
                  .updateRegistrationStatus(
                    session,
                    params['registrationId'],
                    params['newStatus'],
                    notes: params['notes'],
                  ),
        ),
        'registerForEvent': _i1.MethodConnector(
          name: 'registerForEvent',
          params: {
            'registration': _i1.ParameterDescription(
              name: 'registration',
              type: _i1.getType<_i13.EventRegistration>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['registration'] as _i5.RegistrationEndpoint)
                  .registerForEvent(
                    session,
                    params['registration'],
                  ),
        ),
        'cancelRegistration': _i1.MethodConnector(
          name: 'cancelRegistration',
          params: {
            'registrationId': _i1.ParameterDescription(
              name: 'registrationId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['registration'] as _i5.RegistrationEndpoint)
                  .cancelRegistration(
                    session,
                    params['registrationId'],
                  ),
        ),
      },
    );
    connectors['section'] = _i1.EndpointConnector(
      name: 'section',
      endpoint: endpoints['section']!,
      methodConnectors: {
        'getSection': _i1.MethodConnector(
          name: 'getSection',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['section'] as _i6.SectionEndpoint).getSection(
                    session,
                    params['id'],
                  ),
        ),
        'listSections': _i1.MethodConnector(
          name: 'listSections',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['section'] as _i6.SectionEndpoint)
                  .listSections(session),
        ),
        'getSectionsForCurrentUser': _i1.MethodConnector(
          name: 'getSectionsForCurrentUser',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['section'] as _i6.SectionEndpoint)
                  .getSectionsForCurrentUser(session),
        ),
      },
    );
    connectors['tripLeader'] = _i1.EndpointConnector(
      name: 'tripLeader',
      endpoint: endpoints['tripLeader']!,
      methodConnectors: {
        'assignTripLeader': _i1.MethodConnector(
          name: 'assignTripLeader',
          params: {
            'tripLeader': _i1.ParameterDescription(
              name: 'tripLeader',
              type: _i1.getType<_i14.EventTripLeader>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['tripLeader'] as _i7.TripLeaderEndpoint)
                  .assignTripLeader(
                    session,
                    params['tripLeader'],
                  ),
        ),
        'removeTripLeader': _i1.MethodConnector(
          name: 'removeTripLeader',
          params: {
            'tripLeader': _i1.ParameterDescription(
              name: 'tripLeader',
              type: _i1.getType<_i14.EventTripLeader>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['tripLeader'] as _i7.TripLeaderEndpoint)
                  .removeTripLeader(
                    session,
                    params['tripLeader'],
                  ),
        ),
        'listEventTripLeaders': _i1.MethodConnector(
          name: 'listEventTripLeaders',
          params: {
            'eventId': _i1.ParameterDescription(
              name: 'eventId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['tripLeader'] as _i7.TripLeaderEndpoint)
                  .listEventTripLeaders(
                    session,
                    params['eventId'],
                  ),
        ),
        'listTripLeaderEvents': _i1.MethodConnector(
          name: 'listTripLeaderEvents',
          params: {
            'memberId': _i1.ParameterDescription(
              name: 'memberId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['tripLeader'] as _i7.TripLeaderEndpoint)
                  .listTripLeaderEvents(
                    session,
                    params['memberId'],
                  ),
        ),
        'listEventsWithoutTripLeader': _i1.MethodConnector(
          name: 'listEventsWithoutTripLeader',
          params: {
            'sectionId': _i1.ParameterDescription(
              name: 'sectionId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['tripLeader'] as _i7.TripLeaderEndpoint)
                  .listEventsWithoutTripLeader(
                    session,
                    params['sectionId'],
                  ),
        ),
        'listSectionTripLeaders': _i1.MethodConnector(
          name: 'listSectionTripLeaders',
          params: {
            'sectionId': _i1.ParameterDescription(
              name: 'sectionId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['tripLeader'] as _i7.TripLeaderEndpoint)
                  .listSectionTripLeaders(
                    session,
                    params['sectionId'],
                  ),
        ),
      },
    );
    modules['serverpod_auth'] = _i15.Endpoints()..initializeEndpoints(server);
  }
}
