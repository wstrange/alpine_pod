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
import '../auth/auth_endpoints.dart' as _i2;
import '../endpoints/admin_endpoint.dart' as _i3;
import '../endpoints/event_endpoint.dart' as _i4;
import '../endpoints/event_manager_endpoint.dart' as _i5;
import '../endpoints/member_endpoint.dart' as _i6;
import '../endpoints/registration_endpoint.dart' as _i7;
import '../endpoints/section_endpoint.dart' as _i8;
import 'package:alpine_pod_server/src/generated/section.dart' as _i9;
import 'package:alpine_pod_server/src/generated/event.dart' as _i10;
import 'package:alpine_pod_server/src/generated/event_manager.dart' as _i11;
import 'package:alpine_pod_server/src/generated/member.dart' as _i12;
import 'package:alpine_pod_server/src/generated/section_membership.dart'
    as _i13;
import 'package:alpine_pod_server/src/generated/registration_status.dart'
    as _i14;
import 'package:alpine_pod_server/src/generated/event_registration.dart'
    as _i15;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i16;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i17;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'emailIdp': _i2.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'refreshJwtTokens': _i2.RefreshJwtTokensEndpoint()
        ..initialize(
          server,
          'refreshJwtTokens',
          null,
        ),
      'admin': _i3.AdminEndpoint()
        ..initialize(
          server,
          'admin',
          null,
        ),
      'event': _i4.EventEndpoint()
        ..initialize(
          server,
          'event',
          null,
        ),
      'eventManager': _i5.EventManagerEndpoint()
        ..initialize(
          server,
          'eventManager',
          null,
        ),
      'member': _i6.MemberEndpoint()
        ..initialize(
          server,
          'member',
          null,
        ),
      'registration': _i7.RegistrationEndpoint()
        ..initialize(
          server,
          'registration',
          null,
        ),
      'section': _i8.SectionEndpoint()
        ..initialize(
          server,
          'section',
          null,
        ),
    };
    connectors['emailIdp'] = _i1.EndpointConnector(
      name: 'emailIdp',
      endpoint: endpoints['emailIdp']!,
      methodConnectors: {
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint).login(
                session,
                email: params['email'],
                password: params['password'],
              ),
        ),
        'startRegistration': _i1.MethodConnector(
          name: 'startRegistration',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .startRegistration(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyRegistrationCode': _i1.MethodConnector(
          name: 'verifyRegistrationCode',
          params: {
            'accountRequestId': _i1.ParameterDescription(
              name: 'accountRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .verifyRegistrationCode(
                    session,
                    accountRequestId: params['accountRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishRegistration': _i1.MethodConnector(
          name: 'finishRegistration',
          params: {
            'registrationToken': _i1.ParameterDescription(
              name: 'registrationToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .finishRegistration(
                    session,
                    registrationToken: params['registrationToken'],
                    password: params['password'],
                  ),
        ),
        'startPasswordReset': _i1.MethodConnector(
          name: 'startPasswordReset',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .startPasswordReset(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyPasswordResetCode': _i1.MethodConnector(
          name: 'verifyPasswordResetCode',
          params: {
            'passwordResetRequestId': _i1.ParameterDescription(
              name: 'passwordResetRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .verifyPasswordResetCode(
                    session,
                    passwordResetRequestId: params['passwordResetRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishPasswordReset': _i1.MethodConnector(
          name: 'finishPasswordReset',
          params: {
            'finishPasswordResetToken': _i1.ParameterDescription(
              name: 'finishPasswordResetToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'newPassword': _i1.ParameterDescription(
              name: 'newPassword',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .finishPasswordReset(
                    session,
                    finishPasswordResetToken:
                        params['finishPasswordResetToken'],
                    newPassword: params['newPassword'],
                  ),
        ),
        'hasAccount': _i1.MethodConnector(
          name: 'hasAccount',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .hasAccount(session),
        ),
      },
    );
    connectors['refreshJwtTokens'] = _i1.EndpointConnector(
      name: 'refreshJwtTokens',
      endpoint: endpoints['refreshJwtTokens']!,
      methodConnectors: {
        'refreshAccessToken': _i1.MethodConnector(
          name: 'refreshAccessToken',
          params: {
            'refreshToken': _i1.ParameterDescription(
              name: 'refreshToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['refreshJwtTokens']
                          as _i2.RefreshJwtTokensEndpoint)
                      .refreshAccessToken(
                        session,
                        refreshToken: params['refreshToken'],
                      ),
        ),
      },
    );
    connectors['admin'] = _i1.EndpointConnector(
      name: 'admin',
      endpoint: endpoints['admin']!,
      methodConnectors: {
        'createSection': _i1.MethodConnector(
          name: 'createSection',
          params: {
            'section': _i1.ParameterDescription(
              name: 'section',
              type: _i1.getType<_i9.Section>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['admin'] as _i3.AdminEndpoint).createSection(
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
              ) async => (endpoints['admin'] as _i3.AdminEndpoint).getSection(
                session,
                params['id'],
              ),
        ),
        'updateSection': _i1.MethodConnector(
          name: 'updateSection',
          params: {
            'section': _i1.ParameterDescription(
              name: 'section',
              type: _i1.getType<_i9.Section>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['admin'] as _i3.AdminEndpoint).updateSection(
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
                  (endpoints['admin'] as _i3.AdminEndpoint).deleteSection(
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
              ) async => (endpoints['admin'] as _i3.AdminEndpoint).listSections(
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
              type: _i1.getType<_i10.Event>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['event'] as _i4.EventEndpoint).createEvent(
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
              ) async => (endpoints['event'] as _i4.EventEndpoint).getEvent(
                session,
                params['id'],
              ),
        ),
        'updateEvent': _i1.MethodConnector(
          name: 'updateEvent',
          params: {
            'event': _i1.ParameterDescription(
              name: 'event',
              type: _i1.getType<_i10.Event>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['event'] as _i4.EventEndpoint).updateEvent(
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
              ) async => (endpoints['event'] as _i4.EventEndpoint).deleteEvent(
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
            'startTime': _i1.ParameterDescription(
              name: 'startTime',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            ),
            'endTime': _i1.ParameterDescription(
              name: 'endTime',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['event'] as _i4.EventEndpoint).listEvents(
                session,
                params['sectionId'],
                params['startTime'],
                params['endTime'],
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
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['event'] as _i4.EventEndpoint).registerForEvent(
                    session,
                    params['eventId'],
                  ),
        ),
      },
    );
    connectors['eventManager'] = _i1.EndpointConnector(
      name: 'eventManager',
      endpoint: endpoints['eventManager']!,
      methodConnectors: {
        'assignEventManager': _i1.MethodConnector(
          name: 'assignEventManager',
          params: {
            'eventManager': _i1.ParameterDescription(
              name: 'eventManager',
              type: _i1.getType<_i11.EventManager>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['eventManager'] as _i5.EventManagerEndpoint)
                  .assignEventManager(
                    session,
                    params['eventManager'],
                  ),
        ),
        'removeEventManager': _i1.MethodConnector(
          name: 'removeEventManager',
          params: {
            'eventManager': _i1.ParameterDescription(
              name: 'eventManager',
              type: _i1.getType<_i11.EventManager>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['eventManager'] as _i5.EventManagerEndpoint)
                  .removeEventManager(
                    session,
                    params['eventManager'],
                  ),
        ),
        'addMemberToEvent': _i1.MethodConnector(
          name: 'addMemberToEvent',
          params: {
            'eventId': _i1.ParameterDescription(
              name: 'eventId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
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
              ) async => (endpoints['eventManager'] as _i5.EventManagerEndpoint)
                  .addMemberToEvent(
                    session,
                    params['eventId'],
                    params['memberId'],
                  ),
        ),
        'removeMemberFromEvent': _i1.MethodConnector(
          name: 'removeMemberFromEvent',
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
              ) async => (endpoints['eventManager'] as _i5.EventManagerEndpoint)
                  .removeMemberFromEvent(
                    session,
                    params['registrationId'],
                  ),
        ),
        'listEventManagers': _i1.MethodConnector(
          name: 'listEventManagers',
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
              ) async => (endpoints['eventManager'] as _i5.EventManagerEndpoint)
                  .listEventManagers(
                    session,
                    params['eventId'],
                  ),
        ),
        'listEventManagerEvents': _i1.MethodConnector(
          name: 'listEventManagerEvents',
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
              ) async => (endpoints['eventManager'] as _i5.EventManagerEndpoint)
                  .listEventManagerEvents(
                    session,
                    params['memberId'],
                  ),
        ),
        'listEventsWithoutEventManager': _i1.MethodConnector(
          name: 'listEventsWithoutEventManager',
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
              ) async => (endpoints['eventManager'] as _i5.EventManagerEndpoint)
                  .listEventsWithoutEventManager(
                    session,
                    params['sectionId'],
                  ),
        ),
        'listSectionEventManagers': _i1.MethodConnector(
          name: 'listSectionEventManagers',
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
              ) async => (endpoints['eventManager'] as _i5.EventManagerEndpoint)
                  .listSectionEventManagers(
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
              ) async => (endpoints['member'] as _i6.MemberEndpoint)
                  .getCurrentMember(session),
        ),
        'getMembers': _i1.MethodConnector(
          name: 'getMembers',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['member'] as _i6.MemberEndpoint).getMembers(
                session,
              ),
        ),
        'createMember': _i1.MethodConnector(
          name: 'createMember',
          params: {
            'member': _i1.ParameterDescription(
              name: 'member',
              type: _i1.getType<_i12.Member>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['member'] as _i6.MemberEndpoint).createMember(
                    session,
                    params['member'],
                  ),
        ),
        'addMemberToSection': _i1.MethodConnector(
          name: 'addMemberToSection',
          params: {
            'membership': _i1.ParameterDescription(
              name: 'membership',
              type: _i1.getType<_i13.SectionMembership>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['member'] as _i6.MemberEndpoint)
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
              type: _i1.getType<_i13.SectionMembership>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['member'] as _i6.MemberEndpoint)
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
              type: _i1.getType<_i12.Member>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['member'] as _i6.MemberEndpoint).updateMember(
                    session,
                    params['member'],
                  ),
        ),
        'getSectionMembers': _i1.MethodConnector(
          name: 'getSectionMembers',
          params: {
            'sectionId': _i1.ParameterDescription(
              name: 'sectionId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['member'] as _i6.MemberEndpoint).getSectionMembers(
                    session,
                    params['sectionId'],
                    filter: params['filter'],
                  ),
        ),
        'getSectionMemberships': _i1.MethodConnector(
          name: 'getSectionMemberships',
          params: {
            'sectionId': _i1.ParameterDescription(
              name: 'sectionId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['member'] as _i6.MemberEndpoint)
                  .getSectionMemberships(
                    session,
                    params['sectionId'],
                    filter: params['filter'],
                  ),
        ),
        'getMySectionMembership': _i1.MethodConnector(
          name: 'getMySectionMembership',
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
              ) async => (endpoints['member'] as _i6.MemberEndpoint)
                  .getMySectionMembership(
                    session,
                    params['sectionId'],
                  ),
        ),
        'getAllMySectionMemberships': _i1.MethodConnector(
          name: 'getAllMySectionMemberships',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['member'] as _i6.MemberEndpoint)
                  .getAllMySectionMemberships(session),
        ),
        'updateMemberScopes': _i1.MethodConnector(
          name: 'updateMemberScopes',
          params: {
            'memberId': _i1.ParameterDescription(
              name: 'memberId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sectionId': _i1.ParameterDescription(
              name: 'sectionId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'newScopes': _i1.ParameterDescription(
              name: 'newScopes',
              type: _i1.getType<Set<String>>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['member'] as _i6.MemberEndpoint)
                  .updateMemberScopes(
                    session,
                    params['memberId'],
                    params['sectionId'],
                    params['newScopes'],
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
              type: _i1.getType<_i14.RegistrationStatus>(),
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
              ) async => (endpoints['registration'] as _i7.RegistrationEndpoint)
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
              type: _i1.getType<_i15.EventRegistration>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['registration'] as _i7.RegistrationEndpoint)
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
              ) async => (endpoints['registration'] as _i7.RegistrationEndpoint)
                  .cancelRegistration(
                    session,
                    params['registrationId'],
                  ),
        ),
        'getRegistrationsForEvent': _i1.MethodConnector(
          name: 'getRegistrationsForEvent',
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
              ) async => (endpoints['registration'] as _i7.RegistrationEndpoint)
                  .getRegistrationsForEvent(
                    session,
                    params['eventId'],
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
                  (endpoints['section'] as _i8.SectionEndpoint).getSection(
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
              ) async => (endpoints['section'] as _i8.SectionEndpoint)
                  .listSections(session),
        ),
        'getSectionsForCurrentUser': _i1.MethodConnector(
          name: 'getSectionsForCurrentUser',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['section'] as _i8.SectionEndpoint)
                  .getSectionsForCurrentUser(session),
        ),
      },
    );
    modules['serverpod_auth_idp'] = _i16.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_core'] = _i17.Endpoints()
      ..initializeEndpoints(server);
  }
}
