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
import '../endpoints/registration_endpoint.dart' as _i3;
import '../endpoints/user_endpoint.dart' as _i4;
import '../greeting_endpoint.dart' as _i5;
import 'package:alpine_pod_server/src/generated/event.dart' as _i6;
import 'package:alpine_pod_server/src/generated/registration_status.dart'
    as _i7;
import 'package:alpine_pod_server/src/generated/user_role.dart' as _i8;
import 'package:alpine_pod_server/src/generated/section_membership.dart' as _i9;

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
      'registration': _i3.RegistrationEndpoint()
        ..initialize(
          server,
          'registration',
          null,
        ),
      'user': _i4.UserEndpoint()
        ..initialize(
          server,
          'user',
          null,
        ),
      'greeting': _i5.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
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
              type: _i1.getType<_i7.RegistrationStatus>(),
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
              (endpoints['registration'] as _i3.RegistrationEndpoint)
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
            'eventId': _i1.ParameterDescription(
              name: 'eventId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'waiverAccepted': _i1.ParameterDescription(
              name: 'waiverAccepted',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
            'additionalGuests': _i1.ParameterDescription(
              name: 'additionalGuests',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['registration'] as _i3.RegistrationEndpoint)
                  .registerForEvent(
            session,
            params['eventId'],
            params['waiverAccepted'],
            params['additionalGuests'],
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
              (endpoints['registration'] as _i3.RegistrationEndpoint)
                  .cancelRegistration(
            session,
            params['registrationId'],
          ),
        ),
      },
    );
    connectors['user'] = _i1.EndpointConnector(
      name: 'user',
      endpoint: endpoints['user']!,
      methodConnectors: {
        'updateUserRole': _i1.MethodConnector(
          name: 'updateUserRole',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'newRole': _i1.ParameterDescription(
              name: 'newRole',
              type: _i1.getType<_i8.UserRole>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i4.UserEndpoint).updateUserRole(
            session,
            params['userId'],
            params['newRole'],
          ),
        ),
        'addUserToSection': _i1.MethodConnector(
          name: 'addUserToSection',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sectionId': _i1.ParameterDescription(
              name: 'sectionId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'externalUserId': _i1.ParameterDescription(
              name: 'externalUserId',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'sourceSystem': _i1.ParameterDescription(
              name: 'sourceSystem',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i4.UserEndpoint).addUserToSection(
            session,
            params['userId'],
            params['sectionId'],
            externalUserId: params['externalUserId'],
            sourceSystem: params['sourceSystem'],
          ),
        ),
        'removeUserFromSection': _i1.MethodConnector(
          name: 'removeUserFromSection',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sectionId': _i1.ParameterDescription(
              name: 'sectionId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i4.UserEndpoint).removeUserFromSection(
            session,
            params['userId'],
            params['sectionId'],
          ),
        ),
        'syncSectionMembership': _i1.MethodConnector(
          name: 'syncSectionMembership',
          params: {
            'memberships': _i1.ParameterDescription(
              name: 'memberships',
              type: _i1.getType<List<_i9.SectionMembership>>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i4.UserEndpoint).syncSectionMembership(
            session,
            params['memberships'],
          ),
        ),
      },
    );
    connectors['greeting'] = _i1.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['greeting'] as _i5.GreetingEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
  }
}
