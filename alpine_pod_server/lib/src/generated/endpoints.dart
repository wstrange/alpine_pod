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
import 'dart:typed_data' as _idt;
import 'package:alpine_pod_server/src/generated/event.dart' as _ix3n45j3;
import 'package:alpine_pod_server/src/generated/event_manager.dart'
    as _ic9gt6sp;
import 'package:alpine_pod_server/src/generated/event_registration.dart'
    as _ilehff48;
import 'package:alpine_pod_server/src/generated/event_template.dart'
    as _ien9qwaj;
import 'package:alpine_pod_server/src/generated/future_calls.dart' as _ikpth085;
import 'package:alpine_pod_server/src/generated/member.dart' as _i4yfgm2x;
import 'package:alpine_pod_server/src/generated/registration_status.dart'
    as _i80trig0;
import 'package:alpine_pod_server/src/generated/section.dart' as _ikvglbzb;
import 'package:alpine_pod_server/src/generated/section_membership.dart'
    as _i63wiasb;
import 'package:alpine_pod_server/src/generated/user_notification_preference.dart'
    as _izaiwb1z;
import 'package:serverpod/serverpod.dart' as _is;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _iacs;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _iais;
import '../auth/auth_endpoints.dart' as _iv2b7hcx;
import '../endpoints/admin_endpoint.dart' as _i5t1w2d2;
import '../endpoints/event_endpoint.dart' as _icw8lb6p;
import '../endpoints/event_manager_endpoint.dart' as _ilhpr0hq;
import '../endpoints/event_template_endpoint.dart' as _i148pmbd;
import '../endpoints/member_endpoint.dart' as _iyz2rnhz;
import '../endpoints/notification_endpoint.dart' as _ihb11yhk;
import '../endpoints/registration_endpoint.dart' as _ii8lddo2;
import '../endpoints/section_endpoint.dart' as _i1uqsrrw;
import '../endpoints/status_endpoint.dart' as _iv1cbiab;
import '../endpoints/user_profile_endpoint.dart' as _i5r4pchv;
export 'future_calls.dart' show ServerpodFutureCallsGetter;

class Endpoints extends _is.EndpointDispatch {
  @override
  void initializeEndpoints(_is.Server server) {
    var endpoints = <String, _is.Endpoint>{
      'emailIdp': _iv2b7hcx.EmailIdpEndpoint()
        ..initialize(server, 'emailIdp', null),
      'refreshJwtTokens': _iv2b7hcx.RefreshJwtTokensEndpoint()
        ..initialize(server, 'refreshJwtTokens', null),
      'googleIdp': _iv2b7hcx.GoogleIdpEndpoint()
        ..initialize(server, 'googleIdp', null),
      'facebookIdp': _iv2b7hcx.FacebookIdpEndpoint()
        ..initialize(server, 'facebookIdp', null),
      'admin': _i5t1w2d2.AdminEndpoint()..initialize(server, 'admin', null),
      'event': _icw8lb6p.EventEndpoint()..initialize(server, 'event', null),
      'eventManager': _ilhpr0hq.EventManagerEndpoint()
        ..initialize(server, 'eventManager', null),
      'eventTemplate': _i148pmbd.EventTemplateEndpoint()
        ..initialize(server, 'eventTemplate', null),
      'member': _iyz2rnhz.MemberEndpoint()..initialize(server, 'member', null),
      'notification': _ihb11yhk.NotificationEndpoint()
        ..initialize(server, 'notification', null),
      'registration': _ii8lddo2.RegistrationEndpoint()
        ..initialize(server, 'registration', null),
      'section': _i1uqsrrw.SectionEndpoint()
        ..initialize(server, 'section', null),
      'status': _iv1cbiab.StatusEndpoint()..initialize(server, 'status', null),
      'userProfile': _i5r4pchv.UserProfileEndpoint()
        ..initialize(server, 'userProfile', null),
    };
    connectors['emailIdp'] = _is.EndpointConnector(
      name: 'emailIdp',
      endpoint: endpoints['emailIdp']!,
      methodConnectors: {
        'login': _is.MethodConnector(
          name: 'login',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'password': _is.ParameterDescription(
              name: 'password',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['emailIdp'] as _iv2b7hcx.EmailIdpEndpoint).login(
                session,
                email: params['email'],
                password: params['password'],
              ),
        ),
        'startRegistration': _is.MethodConnector(
          name: 'startRegistration',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['emailIdp'] as _iv2b7hcx.EmailIdpEndpoint)
                  .startRegistration(session, email: params['email']),
        ),
        'verifyRegistrationCode': _is.MethodConnector(
          name: 'verifyRegistrationCode',
          params: {
            'accountRequestId': _is.ParameterDescription(
              name: 'accountRequestId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _is.ParameterDescription(
              name: 'verificationCode',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['emailIdp'] as _iv2b7hcx.EmailIdpEndpoint)
                  .verifyRegistrationCode(
                    session,
                    accountRequestId: params['accountRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishRegistration': _is.MethodConnector(
          name: 'finishRegistration',
          params: {
            'registrationToken': _is.ParameterDescription(
              name: 'registrationToken',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'password': _is.ParameterDescription(
              name: 'password',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['emailIdp'] as _iv2b7hcx.EmailIdpEndpoint)
                  .finishRegistration(
                    session,
                    registrationToken: params['registrationToken'],
                    password: params['password'],
                  ),
        ),
        'startPasswordReset': _is.MethodConnector(
          name: 'startPasswordReset',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['emailIdp'] as _iv2b7hcx.EmailIdpEndpoint)
                  .startPasswordReset(session, email: params['email']),
        ),
        'verifyPasswordResetCode': _is.MethodConnector(
          name: 'verifyPasswordResetCode',
          params: {
            'passwordResetRequestId': _is.ParameterDescription(
              name: 'passwordResetRequestId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _is.ParameterDescription(
              name: 'verificationCode',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['emailIdp'] as _iv2b7hcx.EmailIdpEndpoint)
                  .verifyPasswordResetCode(
                    session,
                    passwordResetRequestId: params['passwordResetRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishPasswordReset': _is.MethodConnector(
          name: 'finishPasswordReset',
          params: {
            'finishPasswordResetToken': _is.ParameterDescription(
              name: 'finishPasswordResetToken',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'newPassword': _is.ParameterDescription(
              name: 'newPassword',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['emailIdp'] as _iv2b7hcx.EmailIdpEndpoint)
                  .finishPasswordReset(
                    session,
                    finishPasswordResetToken:
                        params['finishPasswordResetToken'],
                    newPassword: params['newPassword'],
                  ),
        ),
        'hasAccount': _is.MethodConnector(
          name: 'hasAccount',
          params: {},
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['emailIdp'] as _iv2b7hcx.EmailIdpEndpoint).hasAccount(
                session,
              ),
        ),
      },
    );
    connectors['refreshJwtTokens'] = _is.EndpointConnector(
      name: 'refreshJwtTokens',
      endpoint: endpoints['refreshJwtTokens']!,
      methodConnectors: {
        'refreshAccessToken': _is.MethodConnector(
          name: 'refreshAccessToken',
          params: {
            'refreshToken': _is.ParameterDescription(
              name: 'refreshToken',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['refreshJwtTokens']
                      as _iv2b7hcx.RefreshJwtTokensEndpoint)
                  .refreshAccessToken(
                    session,
                    refreshToken: params['refreshToken'],
                  ),
        ),
      },
    );
    connectors['googleIdp'] = _is.EndpointConnector(
      name: 'googleIdp',
      endpoint: endpoints['googleIdp']!,
      methodConnectors: {
        'login': _is.MethodConnector(
          name: 'login',
          params: {
            'idToken': _is.ParameterDescription(
              name: 'idToken',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'accessToken': _is.ParameterDescription(
              name: 'accessToken',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['googleIdp'] as _iv2b7hcx.GoogleIdpEndpoint).login(
                session,
                idToken: params['idToken'],
                accessToken: params['accessToken'],
              ),
        ),
        'loginWithCode': _is.MethodConnector(
          name: 'loginWithCode',
          params: {
            'code': _is.ParameterDescription(
              name: 'code',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'codeVerifier': _is.ParameterDescription(
              name: 'codeVerifier',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'redirectUri': _is.ParameterDescription(
              name: 'redirectUri',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['googleIdp'] as _iv2b7hcx.GoogleIdpEndpoint)
                  .loginWithCode(
                    session,
                    code: params['code'],
                    codeVerifier: params['codeVerifier'],
                    redirectUri: params['redirectUri'],
                  ),
        ),
        'hasAccount': _is.MethodConnector(
          name: 'hasAccount',
          params: {},
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['googleIdp'] as _iv2b7hcx.GoogleIdpEndpoint)
                  .hasAccount(session),
        ),
      },
    );
    connectors['facebookIdp'] = _is.EndpointConnector(
      name: 'facebookIdp',
      endpoint: endpoints['facebookIdp']!,
      methodConnectors: {
        'login': _is.MethodConnector(
          name: 'login',
          params: {
            'accessToken': _is.ParameterDescription(
              name: 'accessToken',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['facebookIdp'] as _iv2b7hcx.FacebookIdpEndpoint).login(
                session,
                accessToken: params['accessToken'],
              ),
        ),
        'hasAccount': _is.MethodConnector(
          name: 'hasAccount',
          params: {},
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['facebookIdp'] as _iv2b7hcx.FacebookIdpEndpoint)
                  .hasAccount(session),
        ),
      },
    );
    connectors['admin'] = _is.EndpointConnector(
      name: 'admin',
      endpoint: endpoints['admin']!,
      methodConnectors: {
        'createSection': _is.MethodConnector(
          name: 'createSection',
          params: {
            'section': _is.ParameterDescription(
              name: 'section',
              type: _is.getType<_ikvglbzb.Section>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['admin'] as _i5t1w2d2.AdminEndpoint).createSection(
                session,
                params['section'],
              ),
        ),
        'getSection': _is.MethodConnector(
          name: 'getSection',
          params: {
            'id': _is.ParameterDescription(
              name: 'id',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['admin'] as _i5t1w2d2.AdminEndpoint).getSection(
                session,
                params['id'],
              ),
        ),
        'updateSection': _is.MethodConnector(
          name: 'updateSection',
          params: {
            'section': _is.ParameterDescription(
              name: 'section',
              type: _is.getType<_ikvglbzb.Section>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['admin'] as _i5t1w2d2.AdminEndpoint).updateSection(
                session,
                params['section'],
              ),
        ),
        'deleteSection': _is.MethodConnector(
          name: 'deleteSection',
          params: {
            'id': _is.ParameterDescription(
              name: 'id',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['admin'] as _i5t1w2d2.AdminEndpoint).deleteSection(
                session,
                params['id'],
              ),
        ),
        'listSections': _is.MethodConnector(
          name: 'listSections',
          params: {},
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['admin'] as _i5t1w2d2.AdminEndpoint).listSections(
                session,
              ),
        ),
        'getMember': _is.MethodConnector(
          name: 'getMember',
          params: {
            'id': _is.ParameterDescription(
              name: 'id',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['admin'] as _i5t1w2d2.AdminEndpoint).getMember(
                session,
                params['id'],
              ),
        ),
        'deleteUser': _is.MethodConnector(
          name: 'deleteUser',
          params: {
            'memberId': _is.ParameterDescription(
              name: 'memberId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['admin'] as _i5t1w2d2.AdminEndpoint).deleteUser(
                session,
                params['memberId'],
              ),
        ),
        'getNotificationDeliveries': _is.MethodConnector(
          name: 'getNotificationDeliveries',
          params: {
            'limit': _is.ParameterDescription(
              name: 'limit',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'offset': _is.ParameterDescription(
              name: 'offset',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'statusFilter': _is.ParameterDescription(
              name: 'statusFilter',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['admin'] as _i5t1w2d2.AdminEndpoint)
                  .getNotificationDeliveries(
                    session,
                    limit: params['limit'],
                    offset: params['offset'],
                    statusFilter: params['statusFilter'],
                  ),
        ),
        'clearNotificationDeliveries': _is.MethodConnector(
          name: 'clearNotificationDeliveries',
          params: {},
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['admin'] as _i5t1w2d2.AdminEndpoint)
                  .clearNotificationDeliveries(session),
        ),
        'retryFailedNotifications': _is.MethodConnector(
          name: 'retryFailedNotifications',
          params: {},
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['admin'] as _i5t1w2d2.AdminEndpoint)
                  .retryFailedNotifications(session),
        ),
      },
    );
    connectors['event'] = _is.EndpointConnector(
      name: 'event',
      endpoint: endpoints['event']!,
      methodConnectors: {
        'createEvent': _is.MethodConnector(
          name: 'createEvent',
          params: {
            'event': _is.ParameterDescription(
              name: 'event',
              type: _is.getType<_ix3n45j3.Event>(),
              nullable: false,
            ),
            'additionalManagerIds': _is.ParameterDescription(
              name: 'additionalManagerIds',
              type: _is.getType<List<_is.UuidValue>?>(),
              nullable: true,
            ),
            'notifyNewEvent': _is.ParameterDescription(
              name: 'notifyNewEvent',
              type: _is.getType<bool>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['event'] as _icw8lb6p.EventEndpoint).createEvent(
                session,
                params['event'],
                additionalManagerIds: params['additionalManagerIds'],
                notifyNewEvent: params['notifyNewEvent'],
              ),
        ),
        'getEvent': _is.MethodConnector(
          name: 'getEvent',
          params: {
            'id': _is.ParameterDescription(
              name: 'id',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['event'] as _icw8lb6p.EventEndpoint).getEvent(
                session,
                params['id'],
              ),
        ),
        'updateEvent': _is.MethodConnector(
          name: 'updateEvent',
          params: {
            'event': _is.ParameterDescription(
              name: 'event',
              type: _is.getType<_ix3n45j3.Event>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['event'] as _icw8lb6p.EventEndpoint).updateEvent(
                session,
                params['event'],
              ),
        ),
        'deleteEvent': _is.MethodConnector(
          name: 'deleteEvent',
          params: {
            'id': _is.ParameterDescription(
              name: 'id',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['event'] as _icw8lb6p.EventEndpoint).deleteEvent(
                session,
                params['id'],
              ),
        ),
        'listEvents': _is.MethodConnector(
          name: 'listEvents',
          params: {
            'sectionId': _is.ParameterDescription(
              name: 'sectionId',
              type: _is.getType<_is.UuidValue?>(),
              nullable: true,
            ),
            'startTime': _is.ParameterDescription(
              name: 'startTime',
              type: _is.getType<DateTime?>(),
              nullable: true,
            ),
            'endTime': _is.ParameterDescription(
              name: 'endTime',
              type: _is.getType<DateTime?>(),
              nullable: true,
            ),
            'onlyMyEvents': _is.ParameterDescription(
              name: 'onlyMyEvents',
              type: _is.getType<bool>(),
              nullable: false,
            ),
            'sinceLastUpdateTime': _is.ParameterDescription(
              name: 'sinceLastUpdateTime',
              type: _is.getType<DateTime?>(),
              nullable: true,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['event'] as _icw8lb6p.EventEndpoint).listEvents(
                session,
                sectionId: params['sectionId'],
                startTime: params['startTime'],
                endTime: params['endTime'],
                onlyMyEvents: params['onlyMyEvents'],
                sinceLastUpdateTime: params['sinceLastUpdateTime'],
              ),
        ),
        'registerForEvent': _is.MethodConnector(
          name: 'registerForEvent',
          params: {
            'eventId': _is.ParameterDescription(
              name: 'eventId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['event'] as _icw8lb6p.EventEndpoint).registerForEvent(
                session,
                params['eventId'],
              ),
        ),
      },
    );
    connectors['eventManager'] = _is.EndpointConnector(
      name: 'eventManager',
      endpoint: endpoints['eventManager']!,
      methodConnectors: {
        'assignEventManager': _is.MethodConnector(
          name: 'assignEventManager',
          params: {
            'eventManager': _is.ParameterDescription(
              name: 'eventManager',
              type: _is.getType<_ic9gt6sp.EventManager>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['eventManager'] as _ilhpr0hq.EventManagerEndpoint)
                  .assignEventManager(session, params['eventManager']),
        ),
        'removeEventManager': _is.MethodConnector(
          name: 'removeEventManager',
          params: {
            'eventManager': _is.ParameterDescription(
              name: 'eventManager',
              type: _is.getType<_ic9gt6sp.EventManager>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['eventManager'] as _ilhpr0hq.EventManagerEndpoint)
                  .removeEventManager(session, params['eventManager']),
        ),
        'addMemberToEvent': _is.MethodConnector(
          name: 'addMemberToEvent',
          params: {
            'eventId': _is.ParameterDescription(
              name: 'eventId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'memberId': _is.ParameterDescription(
              name: 'memberId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['eventManager'] as _ilhpr0hq.EventManagerEndpoint)
                  .addMemberToEvent(
                    session,
                    params['eventId'],
                    params['memberId'],
                  ),
        ),
        'removeMemberFromEvent': _is.MethodConnector(
          name: 'removeMemberFromEvent',
          params: {
            'registrationId': _is.ParameterDescription(
              name: 'registrationId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['eventManager'] as _ilhpr0hq.EventManagerEndpoint)
                  .removeMemberFromEvent(session, params['registrationId']),
        ),
        'listEventManagers': _is.MethodConnector(
          name: 'listEventManagers',
          params: {
            'eventId': _is.ParameterDescription(
              name: 'eventId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['eventManager'] as _ilhpr0hq.EventManagerEndpoint)
                  .listEventManagers(session, params['eventId']),
        ),
        'listEventManagerEvents': _is.MethodConnector(
          name: 'listEventManagerEvents',
          params: {
            'memberId': _is.ParameterDescription(
              name: 'memberId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['eventManager'] as _ilhpr0hq.EventManagerEndpoint)
                  .listEventManagerEvents(session, params['memberId']),
        ),
        'listEventsWithoutEventManager': _is.MethodConnector(
          name: 'listEventsWithoutEventManager',
          params: {
            'sectionId': _is.ParameterDescription(
              name: 'sectionId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['eventManager'] as _ilhpr0hq.EventManagerEndpoint)
                  .listEventsWithoutEventManager(session, params['sectionId']),
        ),
        'listSectionEventManagers': _is.MethodConnector(
          name: 'listSectionEventManagers',
          params: {
            'sectionId': _is.ParameterDescription(
              name: 'sectionId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['eventManager'] as _ilhpr0hq.EventManagerEndpoint)
                  .listSectionEventManagers(session, params['sectionId']),
        ),
        'approveRegistration': _is.MethodConnector(
          name: 'approveRegistration',
          params: {
            'registrationId': _is.ParameterDescription(
              name: 'registrationId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['eventManager'] as _ilhpr0hq.EventManagerEndpoint)
                  .approveRegistration(session, params['registrationId']),
        ),
      },
    );
    connectors['eventTemplate'] = _is.EndpointConnector(
      name: 'eventTemplate',
      endpoint: endpoints['eventTemplate']!,
      methodConnectors: {
        'listTemplates': _is.MethodConnector(
          name: 'listTemplates',
          params: {},
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['eventTemplate'] as _i148pmbd.EventTemplateEndpoint)
                  .listTemplates(session),
        ),
        'createTemplate': _is.MethodConnector(
          name: 'createTemplate',
          params: {
            'template': _is.ParameterDescription(
              name: 'template',
              type: _is.getType<_ien9qwaj.EventTemplate>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['eventTemplate'] as _i148pmbd.EventTemplateEndpoint)
                  .createTemplate(session, params['template']),
        ),
        'updateTemplate': _is.MethodConnector(
          name: 'updateTemplate',
          params: {
            'template': _is.ParameterDescription(
              name: 'template',
              type: _is.getType<_ien9qwaj.EventTemplate>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['eventTemplate'] as _i148pmbd.EventTemplateEndpoint)
                  .updateTemplate(session, params['template']),
        ),
        'deleteTemplate': _is.MethodConnector(
          name: 'deleteTemplate',
          params: {
            'id': _is.ParameterDescription(
              name: 'id',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['eventTemplate'] as _i148pmbd.EventTemplateEndpoint)
                  .deleteTemplate(session, params['id']),
        ),
      },
    );
    connectors['member'] = _is.EndpointConnector(
      name: 'member',
      endpoint: endpoints['member']!,
      methodConnectors: {
        'getCurrentMember': _is.MethodConnector(
          name: 'getCurrentMember',
          params: {},
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['member'] as _iyz2rnhz.MemberEndpoint)
                  .getCurrentMember(session),
        ),
        'createMember': _is.MethodConnector(
          name: 'createMember',
          params: {
            'member': _is.ParameterDescription(
              name: 'member',
              type: _is.getType<_i4yfgm2x.Member>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['member'] as _iyz2rnhz.MemberEndpoint).createMember(
                session,
                params['member'],
              ),
        ),
        'addMemberToSection': _is.MethodConnector(
          name: 'addMemberToSection',
          params: {
            'membership': _is.ParameterDescription(
              name: 'membership',
              type: _is.getType<_i63wiasb.SectionMembership>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['member'] as _iyz2rnhz.MemberEndpoint)
                  .addMemberToSection(session, params['membership']),
        ),
        'removeMemberFromSection': _is.MethodConnector(
          name: 'removeMemberFromSection',
          params: {
            'membership': _is.ParameterDescription(
              name: 'membership',
              type: _is.getType<_i63wiasb.SectionMembership>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['member'] as _iyz2rnhz.MemberEndpoint)
                  .removeMemberFromSection(session, params['membership']),
        ),
        'getMember': _is.MethodConnector(
          name: 'getMember',
          params: {
            'id': _is.ParameterDescription(
              name: 'id',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['member'] as _iyz2rnhz.MemberEndpoint).getMember(
                session,
                params['id'],
              ),
        ),
        'getMemberSectionMemberships': _is.MethodConnector(
          name: 'getMemberSectionMemberships',
          params: {
            'memberId': _is.ParameterDescription(
              name: 'memberId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['member'] as _iyz2rnhz.MemberEndpoint)
                  .getMemberSectionMemberships(session, params['memberId']),
        ),
        'updateMember': _is.MethodConnector(
          name: 'updateMember',
          params: {
            'member': _is.ParameterDescription(
              name: 'member',
              type: _is.getType<_i4yfgm2x.Member>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['member'] as _iyz2rnhz.MemberEndpoint).updateMember(
                session,
                params['member'],
              ),
        ),
        'acceptWaiver': _is.MethodConnector(
          name: 'acceptWaiver',
          params: {},
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['member'] as _iyz2rnhz.MemberEndpoint).acceptWaiver(
                session,
              ),
        ),
        'getSectionMembers': _is.MethodConnector(
          name: 'getSectionMembers',
          params: {
            'sectionId': _is.ParameterDescription(
              name: 'sectionId',
              type: _is.getType<_is.UuidValue?>(),
              nullable: true,
            ),
            'filter': _is.ParameterDescription(
              name: 'filter',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'limit': _is.ParameterDescription(
              name: 'limit',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'offset': _is.ParameterDescription(
              name: 'offset',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'sinceLastUpdate': _is.ParameterDescription(
              name: 'sinceLastUpdate',
              type: _is.getType<DateTime?>(),
              nullable: true,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['member'] as _iyz2rnhz.MemberEndpoint)
                  .getSectionMembers(
                    session,
                    sectionId: params['sectionId'],
                    filter: params['filter'],
                    limit: params['limit'],
                    offset: params['offset'],
                    sinceLastUpdate: params['sinceLastUpdate'],
                  ),
        ),
        'getSectionMemberships': _is.MethodConnector(
          name: 'getSectionMemberships',
          params: {
            'sectionId': _is.ParameterDescription(
              name: 'sectionId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'filter': _is.ParameterDescription(
              name: 'filter',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'limit': _is.ParameterDescription(
              name: 'limit',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'offset': _is.ParameterDescription(
              name: 'offset',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['member'] as _iyz2rnhz.MemberEndpoint)
                  .getSectionMemberships(
                    session,
                    params['sectionId'],
                    filter: params['filter'],
                    limit: params['limit'],
                    offset: params['offset'],
                  ),
        ),
        'getMySectionMembership': _is.MethodConnector(
          name: 'getMySectionMembership',
          params: {
            'sectionId': _is.ParameterDescription(
              name: 'sectionId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['member'] as _iyz2rnhz.MemberEndpoint)
                  .getMySectionMembership(session, params['sectionId']),
        ),
        'getAllMySectionMemberships': _is.MethodConnector(
          name: 'getAllMySectionMemberships',
          params: {},
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['member'] as _iyz2rnhz.MemberEndpoint)
                  .getAllMySectionMemberships(session),
        ),
        'updateMemberScopes': _is.MethodConnector(
          name: 'updateMemberScopes',
          params: {
            'memberId': _is.ParameterDescription(
              name: 'memberId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'sectionId': _is.ParameterDescription(
              name: 'sectionId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'newScopes': _is.ParameterDescription(
              name: 'newScopes',
              type: _is.getType<Set<String>>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['member'] as _iyz2rnhz.MemberEndpoint)
                  .updateMemberScopes(
                    session,
                    params['memberId'],
                    params['sectionId'],
                    params['newScopes'],
                  ),
        ),
        'registerMember': _is.MethodConnector(
          name: 'registerMember',
          params: {
            'member': _is.ParameterDescription(
              name: 'member',
              type: _is.getType<_i4yfgm2x.Member>(),
              nullable: false,
            ),
            'sectionIds': _is.ParameterDescription(
              name: 'sectionIds',
              type: _is.getType<List<_is.UuidValue>>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['member'] as _iyz2rnhz.MemberEndpoint).registerMember(
                session,
                params['member'],
                params['sectionIds'],
              ),
        ),
        'setMemberProfileUrl': _is.MethodConnector(
          name: 'setMemberProfileUrl',
          params: {
            'imageUrl': _is.ParameterDescription(
              name: 'imageUrl',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['member'] as _iyz2rnhz.MemberEndpoint)
                  .setMemberProfileUrl(session, params['imageUrl']),
        ),
      },
    );
    connectors['notification'] = _is.EndpointConnector(
      name: 'notification',
      endpoint: endpoints['notification']!,
      methodConnectors: {
        'getMyFeed': _is.MethodConnector(
          name: 'getMyFeed',
          params: {
            'limit': _is.ParameterDescription(
              name: 'limit',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'offset': _is.ParameterDescription(
              name: 'offset',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['notification'] as _ihb11yhk.NotificationEndpoint)
                  .getMyFeed(
                    session,
                    limit: params['limit'],
                    offset: params['offset'],
                  ),
        ),
        'deleteAll': _is.MethodConnector(
          name: 'deleteAll',
          params: {},
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['notification'] as _ihb11yhk.NotificationEndpoint)
                  .deleteAll(session),
        ),
        'markAsRead': _is.MethodConnector(
          name: 'markAsRead',
          params: {
            'userNotificationId': _is.ParameterDescription(
              name: 'userNotificationId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['notification'] as _ihb11yhk.NotificationEndpoint)
                  .markAsRead(session, params['userNotificationId']),
        ),
        'getMyPreferences': _is.MethodConnector(
          name: 'getMyPreferences',
          params: {},
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['notification'] as _ihb11yhk.NotificationEndpoint)
                  .getMyPreferences(session),
        ),
        'savePreference': _is.MethodConnector(
          name: 'savePreference',
          params: {
            'preference': _is.ParameterDescription(
              name: 'preference',
              type: _is.getType<_izaiwb1z.UserNotificationPreference>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['notification'] as _ihb11yhk.NotificationEndpoint)
                  .savePreference(session, params['preference']),
        ),
        'registerFcmToken': _is.MethodConnector(
          name: 'registerFcmToken',
          params: {
            'token': _is.ParameterDescription(
              name: 'token',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'deviceId': _is.ParameterDescription(
              name: 'deviceId',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['notification'] as _ihb11yhk.NotificationEndpoint)
                  .registerFcmToken(
                    session,
                    params['token'],
                    deviceId: params['deviceId'],
                  ),
        ),
      },
    );
    connectors['registration'] = _is.EndpointConnector(
      name: 'registration',
      endpoint: endpoints['registration']!,
      methodConnectors: {
        'updateRegistrationStatus': _is.MethodConnector(
          name: 'updateRegistrationStatus',
          params: {
            'registrationId': _is.ParameterDescription(
              name: 'registrationId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'newStatus': _is.ParameterDescription(
              name: 'newStatus',
              type: _is.getType<_i80trig0.RegistrationStatus>(),
              nullable: false,
            ),
            'notes': _is.ParameterDescription(
              name: 'notes',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['registration'] as _ii8lddo2.RegistrationEndpoint)
                  .updateRegistrationStatus(
                    session,
                    params['registrationId'],
                    params['newStatus'],
                    notes: params['notes'],
                  ),
        ),
        'registerForEvent': _is.MethodConnector(
          name: 'registerForEvent',
          params: {
            'registration': _is.ParameterDescription(
              name: 'registration',
              type: _is.getType<_ilehff48.EventRegistration>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['registration'] as _ii8lddo2.RegistrationEndpoint)
                  .registerForEvent(session, params['registration']),
        ),
        'cancelRegistration': _is.MethodConnector(
          name: 'cancelRegistration',
          params: {
            'registrationId': _is.ParameterDescription(
              name: 'registrationId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['registration'] as _ii8lddo2.RegistrationEndpoint)
                  .cancelRegistration(session, params['registrationId']),
        ),
        'getRegistrationsForEvent': _is.MethodConnector(
          name: 'getRegistrationsForEvent',
          params: {
            'eventId': _is.ParameterDescription(
              name: 'eventId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['registration'] as _ii8lddo2.RegistrationEndpoint)
                  .getRegistrationsForEvent(session, params['eventId']),
        ),
      },
    );
    connectors['section'] = _is.EndpointConnector(
      name: 'section',
      endpoint: endpoints['section']!,
      methodConnectors: {
        'getSection': _is.MethodConnector(
          name: 'getSection',
          params: {
            'id': _is.ParameterDescription(
              name: 'id',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['section'] as _i1uqsrrw.SectionEndpoint).getSection(
                session,
                params['id'],
              ),
        ),
        'listSections': _is.MethodConnector(
          name: 'listSections',
          params: {},
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['section'] as _i1uqsrrw.SectionEndpoint).listSections(
                session,
              ),
        ),
        'getSectionsForCurrentUser': _is.MethodConnector(
          name: 'getSectionsForCurrentUser',
          params: {},
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['section'] as _i1uqsrrw.SectionEndpoint)
                  .getSectionsForCurrentUser(session),
        ),
      },
    );
    connectors['status'] = _is.EndpointConnector(
      name: 'status',
      endpoint: endpoints['status']!,
      methodConnectors: {
        'getStatus': _is.MethodConnector(
          name: 'getStatus',
          params: {},
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['status'] as _iv1cbiab.StatusEndpoint).getStatus(
                session,
              ),
        ),
      },
    );
    connectors['userProfile'] = _is.EndpointConnector(
      name: 'userProfile',
      endpoint: endpoints['userProfile']!,
      methodConnectors: {
        'setUserImage': _is.MethodConnector(
          name: 'setUserImage',
          params: {
            'image': _is.ParameterDescription(
              name: 'image',
              type: _is.getType<_idt.ByteData>(),
              nullable: false,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['userProfile'] as _i5r4pchv.UserProfileEndpoint)
                  .setUserImage(session, params['image']),
        ),
        'removeUserImage': _is.MethodConnector(
          name: 'removeUserImage',
          params: {},
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['userProfile'] as _i5r4pchv.UserProfileEndpoint)
                  .removeUserImage(session),
        ),
        'changeUserName': _is.MethodConnector(
          name: 'changeUserName',
          params: {
            'userName': _is.ParameterDescription(
              name: 'userName',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['userProfile'] as _i5r4pchv.UserProfileEndpoint)
                  .changeUserName(session, params['userName']),
        ),
        'changeFullName': _is.MethodConnector(
          name: 'changeFullName',
          params: {
            'fullName': _is.ParameterDescription(
              name: 'fullName',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['userProfile'] as _i5r4pchv.UserProfileEndpoint)
                  .changeFullName(session, params['fullName']),
        ),
        'get': _is.MethodConnector(
          name: 'get',
          params: {},
          call: (_is.Session session, Map<String, dynamic> params) async =>
              (endpoints['userProfile'] as _i5r4pchv.UserProfileEndpoint).get(
                session,
              ),
        ),
      },
    );
    modules['serverpod_auth_idp'] = _iais.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_core'] = _iacs.Endpoints()
      ..initializeEndpoints(server);
  }

  @override
  _is.FutureCallDispatch? get futureCalls {
    return _ikpth085.FutureCalls();
  }
}
