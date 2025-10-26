/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/event_endpoint.dart' as _i2;
import '../endpoints/member_endpoint.dart' as _i3;
import '../endpoints/registration_endpoint.dart' as _i4;
import '../endpoints/trip_leader_endpoint.dart' as _i5;
import 'package:alpine_pod_server/src/generated/event.dart' as _i6;
import 'package:alpine_pod_server/src/generated/member.dart' as _i7;
import 'package:alpine_pod_server/src/generated/section_membership.dart' as _i8;
import 'package:alpine_pod_server/src/generated/registration_status.dart'
    as _i9;
import 'package:alpine_pod_server/src/generated/event_registration.dart'
    as _i10;
import 'package:alpine_pod_server/src/generated/event_trip_leader.dart' as _i11;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i12;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'event': _i2.EventEndpoint()
        ..initialize(
          server,
          'event',
          null,
        ),
      'member': _i3.MemberEndpoint()
        ..initialize(
          server,
          'member',
          null,
        ),
      'registration': _i4.RegistrationEndpoint()
        ..initialize(
          server,
          'registration',
          null,
        ),
      'tripLeader': _i5.TripLeaderEndpoint()
        ..initialize(
          server,
          'tripLeader',
          null,
        ),
    };
    connectors['event'] = _i1.EndpointConnector(
      name: 'event',
      endpoint: endpoints['event']!,
      methodConnectors: {
        'createEvent': _i1.MethodConnector(
          name: 'createEvent',
          params: {
            'event': _i1.ParameterDescription(
              name: 'event',
              type: _i1.getType<_i6.Event>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['event'] as _i2.EventEndpoint).createEvent(
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
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['event'] as _i2.EventEndpoint).getEvent(
            session,
            params['id'],
          ),
        ),
        'updateEvent': _i1.MethodConnector(
          name: 'updateEvent',
          params: {
            'event': _i1.ParameterDescription(
              name: 'event',
              type: _i1.getType<_i6.Event>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['event'] as _i2.EventEndpoint).updateEvent(
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
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['event'] as _i2.EventEndpoint).deleteEvent(
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
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['event'] as _i2.EventEndpoint).listEvents(
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
        'updateMemberRole': _i1.MethodConnector(
          name: 'updateMemberRole',
          params: {
            'member': _i1.ParameterDescription(
              name: 'member',
              type: _i1.getType<_i7.Member>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['member'] as _i3.MemberEndpoint).updateMemberRole(
            session,
            params['member'],
          ),
        ),
        'getMembers': _i1.MethodConnector(
          name: 'getMembers',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['member'] as _i3.MemberEndpoint).getMembers(session),
        ),
        'createMember': _i1.MethodConnector(
          name: 'createMember',
          params: {
            'member': _i1.ParameterDescription(
              name: 'member',
              type: _i1.getType<_i7.Member>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['member'] as _i3.MemberEndpoint).createMember(
            session,
            params['member'],
          ),
        ),
        'addMemberToSection': _i1.MethodConnector(
          name: 'addMemberToSection',
          params: {
            'membership': _i1.ParameterDescription(
              name: 'membership',
              type: _i1.getType<_i8.SectionMembership>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['member'] as _i3.MemberEndpoint).addMemberToSection(
            session,
            params['membership'],
          ),
        ),
        'removeMemberFromSection': _i1.MethodConnector(
          name: 'removeMemberFromSection',
          params: {
            'membership': _i1.ParameterDescription(
              name: 'membership',
              type: _i1.getType<_i8.SectionMembership>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['member'] as _i3.MemberEndpoint)
                  .removeMemberFromSection(
            session,
            params['membership'],
          ),
        ),
        'syncSectionMembership': _i1.MethodConnector(
          name: 'syncSectionMembership',
          params: {
            'memberships': _i1.ParameterDescription(
              name: 'memberships',
              type: _i1.getType<List<_i8.SectionMembership>>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['member'] as _i3.MemberEndpoint).syncSectionMembership(
            session,
            params['memberships'],
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
              type: _i1.getType<_i9.RegistrationStatus>(),
              nullable: false,
            ),
            'notes': _i1.ParameterDescription(
              name: 'notes',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['registration'] as _i4.RegistrationEndpoint)
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
              type: _i1.getType<_i10.EventRegistration>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['registration'] as _i4.RegistrationEndpoint)
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
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['registration'] as _i4.RegistrationEndpoint)
                  .cancelRegistration(
            session,
            params['registrationId'],
          ),
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
              type: _i1.getType<_i11.EventTripLeader>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tripLeader'] as _i5.TripLeaderEndpoint)
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
              type: _i1.getType<_i11.EventTripLeader>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tripLeader'] as _i5.TripLeaderEndpoint)
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
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tripLeader'] as _i5.TripLeaderEndpoint)
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
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tripLeader'] as _i5.TripLeaderEndpoint)
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
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tripLeader'] as _i5.TripLeaderEndpoint)
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
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tripLeader'] as _i5.TripLeaderEndpoint)
                  .listSectionTripLeaders(
            session,
            params['sectionId'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i12.Endpoints()..initializeEndpoints(server);
  }
}
