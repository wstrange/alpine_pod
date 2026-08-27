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
import 'dart:async' as _ida;
import 'dart:typed_data' as _idt;

import 'package:alpine_pod_client/src/protocol/event.dart' as _ix4abnwg;
import 'package:alpine_pod_client/src/protocol/event_manager.dart' as _iygn3jma;
import 'package:alpine_pod_client/src/protocol/event_registration.dart'
    as _isud34nx;
import 'package:alpine_pod_client/src/protocol/event_template.dart'
    as _imjavx7o;
import 'package:alpine_pod_client/src/protocol/member.dart' as _ixkkgnmw;
import 'package:alpine_pod_client/src/protocol/notification_delivery.dart'
    as _ionzmxtq;
import 'package:alpine_pod_client/src/protocol/registration_status.dart'
    as _i6udvzgc;
import 'package:alpine_pod_client/src/protocol/section.dart' as _i7dvc5iw;
import 'package:alpine_pod_client/src/protocol/section_membership.dart'
    as _ikapn372;
import 'package:alpine_pod_client/src/protocol/user_notification.dart'
    as _i9cwoz9c;
import 'package:alpine_pod_client/src/protocol/user_notification_preference.dart'
    as _i3sx7kqh;
import 'package:http/http.dart' as _i85jenna;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _iacc;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _iaic;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'package:serverpod_database/serverpod_database.dart' as _isd;

import 'protocol.dart' as _il2as5qe;

import 'package:alpine_pod_client/migrations/migration_registry.dart';

/// {@category Endpoint}
class EndpointEmailIdp extends _iaic.EndpointEmailIdpBase {
  EndpointEmailIdp(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'emailIdp';

  @override
  _ida.Future<_iacc.AuthSuccess> login({
    required String email,
    required String password,
  }) => caller.callServerEndpoint<_iacc.AuthSuccess>('emailIdp', 'login', {
    'email': email,
    'password': password,
  });

  /// Starts the registration for a new user account with an email-based login
  /// associated to it.
  ///
  /// Upon successful completion of this method, an email will have been
  /// sent to [email] with a verification link, which the user must open to
  /// complete the registration.
  ///
  /// Always returns a account request ID, which can be used to complete the
  /// registration. If the email is already registered, the returned ID will not
  /// be valid.
  @override
  _ida.Future<_isc.UuidValue> startRegistration({required String email}) =>
      caller.callServerEndpoint<_isc.UuidValue>(
        'emailIdp',
        'startRegistration',
        {'email': email},
      );

  /// Verifies an account request code and returns a token
  /// that can be used to complete the account creation.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if no request exists
  ///   for the given [accountRequestId] or [verificationCode] is invalid.
  @override
  _ida.Future<String> verifyRegistrationCode({
    required _isc.UuidValue accountRequestId,
    required String verificationCode,
  }) =>
      caller.callServerEndpoint<String>('emailIdp', 'verifyRegistrationCode', {
        'accountRequestId': accountRequestId,
        'verificationCode': verificationCode,
      });

  /// Completes a new account registration, creating a new auth user with a
  /// profile and attaching the given email account to it.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if the [registrationToken]
  ///   is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  ///
  /// Returns a session for the newly created user.
  @override
  _ida.Future<_iacc.AuthSuccess> finishRegistration({
    required String registrationToken,
    required String password,
  }) => caller.callServerEndpoint<_iacc.AuthSuccess>(
    'emailIdp',
    'finishRegistration',
    {'registrationToken': registrationToken, 'password': password},
  );

  /// Requests a password reset for [email].
  ///
  /// If the email address is registered, an email with reset instructions will
  /// be send out. If the email is unknown, this method will have no effect.
  ///
  /// Always returns a password reset request ID, which can be used to complete
  /// the reset. If the email is not registered, the returned ID will not be
  /// valid.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to request a password reset.
  ///
  @override
  _ida.Future<_isc.UuidValue> startPasswordReset({required String email}) =>
      caller.callServerEndpoint<_isc.UuidValue>(
        'emailIdp',
        'startPasswordReset',
        {'email': email},
      );

  /// Verifies a password reset code and returns a finishPasswordResetToken
  /// that can be used to finish the password reset.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to verify the password reset.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// If multiple steps are required to complete the password reset, this endpoint
  /// should be overridden to return credentials for the next step instead
  /// of the credentials for setting the password.
  @override
  _ida.Future<String> verifyPasswordResetCode({
    required _isc.UuidValue passwordResetRequestId,
    required String verificationCode,
  }) =>
      caller.callServerEndpoint<String>('emailIdp', 'verifyPasswordResetCode', {
        'passwordResetRequestId': passwordResetRequestId,
        'verificationCode': verificationCode,
      });

  /// Completes a password reset request by setting a new password.
  ///
  /// The [verificationCode] returned from [verifyPasswordResetCode] is used to
  /// validate the password reset request.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.policyViolation] if the new
  ///   password does not comply with the password policy.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _ida.Future<void> finishPasswordReset({
    required String finishPasswordResetToken,
    required String newPassword,
  }) => caller.callServerEndpoint<void>('emailIdp', 'finishPasswordReset', {
    'finishPasswordResetToken': finishPasswordResetToken,
    'newPassword': newPassword,
  });

  @override
  _ida.Future<bool> hasAccount() =>
      caller.callServerEndpoint<bool>('emailIdp', 'hasAccount', {});
}

/// {@category Endpoint}
class EndpointRefreshJwtTokens extends _iacc.EndpointRefreshJwtTokens {
  EndpointRefreshJwtTokens(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'refreshJwtTokens';

  /// Creates a new token pair for the given [refreshToken].
  ///
  /// If [refreshToken] is omitted, cookie-mode web clients fall back to the
  /// configured HttpOnly refresh cookie. When neither source is present this
  /// throws [RefreshTokenNotFoundException], the same public "no usable refresh
  /// credential" exception used for unknown refresh tokens.
  ///
  /// Can throw the following exceptions:
  /// -[RefreshTokenMalformedException]: refresh token is malformed and could
  ///   not be parsed. Not expected to happen for tokens issued by the server.
  /// -[RefreshTokenNotFoundException]: refresh token is unknown to the server.
  ///   Either the token was deleted or generated by a different server.
  /// -[RefreshTokenExpiredException]: refresh token has expired. Will happen
  ///   only if it has not been used within configured `refreshTokenLifetime`.
  /// -[RefreshTokenInvalidSecretException]: refresh token is incorrect, meaning
  ///   it does not refer to the current secret refresh token. This indicates
  ///   either a malfunctioning client or a malicious attempt by someone who has
  ///   obtained the refresh token. In this case the underlying refresh token
  ///   will be deleted, and access to it will expire fully when the last access
  ///   token is elapsed.
  ///
  /// This endpoint is unauthenticated, meaning the client won't include any
  /// authentication information with the call.
  @override
  _ida.Future<_iacc.AuthSuccess> refreshAccessToken({String? refreshToken}) =>
      caller.callServerEndpoint<_iacc.AuthSuccess>(
        'refreshJwtTokens',
        'refreshAccessToken',
        {'refreshToken': refreshToken},
        authenticated: false,
      );
}

/// {@category Endpoint}
class EndpointGoogleIdp extends _iaic.EndpointGoogleIdpBase {
  EndpointGoogleIdp(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'googleIdp';

  @override
  _ida.Future<_iacc.AuthSuccess> login({
    required String idToken,
    required String? accessToken,
  }) => caller.callServerEndpoint<_iacc.AuthSuccess>('googleIdp', 'login', {
    'idToken': idToken,
    'accessToken': accessToken,
  });

  /// Validates a Google authorization code from the web OAuth2 PKCE flow and
  /// either logs in the associated user or creates a new account.
  ///
  /// This is the web counterpart of [login], which accepts an ID token directly
  /// (used on native platforms via the `google_sign_in` package).
  ///
  /// If a new user is created an associated [UserProfile] is also created.
  @override
  _ida.Future<_iacc.AuthSuccess> loginWithCode({
    required String code,
    required String codeVerifier,
    required String redirectUri,
  }) => caller.callServerEndpoint<_iacc.AuthSuccess>(
    'googleIdp',
    'loginWithCode',
    {'code': code, 'codeVerifier': codeVerifier, 'redirectUri': redirectUri},
  );

  @override
  _ida.Future<bool> hasAccount() =>
      caller.callServerEndpoint<bool>('googleIdp', 'hasAccount', {});
}

/// {@category Endpoint}
class EndpointFacebookIdp extends _iaic.EndpointFacebookIdpBase {
  EndpointFacebookIdp(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'facebookIdp';

  /// Validates a Facebook access token and either logs in the associated user or
  /// creates a new user account if the Facebook account ID is not yet known.
  ///
  /// If the access token is invalid or expired, the
  /// [FacebookAccessTokenVerificationException] will be thrown.
  @override
  _ida.Future<_iacc.AuthSuccess> login({required String accessToken}) =>
      caller.callServerEndpoint<_iacc.AuthSuccess>('facebookIdp', 'login', {
        'accessToken': accessToken,
      });

  @override
  _ida.Future<bool> hasAccount() =>
      caller.callServerEndpoint<bool>('facebookIdp', 'hasAccount', {});
}

/// {@category Endpoint}
class EndpointAdmin extends _isc.EndpointRef {
  EndpointAdmin(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'admin';

  /// Section Management
  _ida.Future<_i7dvc5iw.Section> createSection(_i7dvc5iw.Section section) =>
      caller.callServerEndpoint<_i7dvc5iw.Section>('admin', 'createSection', {
        'section': section,
      });

  _ida.Future<_i7dvc5iw.Section?> getSection(_isc.UuidValue id) =>
      caller.callServerEndpoint<_i7dvc5iw.Section?>('admin', 'getSection', {
        'id': id,
      });

  _ida.Future<_i7dvc5iw.Section> updateSection(_i7dvc5iw.Section section) =>
      caller.callServerEndpoint<_i7dvc5iw.Section>('admin', 'updateSection', {
        'section': section,
      });

  _ida.Future<void> deleteSection(_isc.UuidValue id) =>
      caller.callServerEndpoint<void>('admin', 'deleteSection', {'id': id});

  _ida.Future<List<_i7dvc5iw.Section>> listSections() => caller
      .callServerEndpoint<List<_i7dvc5iw.Section>>('admin', 'listSections', {});

  _ida.Future<_ixkkgnmw.Member?> getMember(_isc.UuidValue id) => caller
      .callServerEndpoint<_ixkkgnmw.Member?>('admin', 'getMember', {'id': id});

  _ida.Future<void> deleteUser(_isc.UuidValue memberId) => caller
      .callServerEndpoint<void>('admin', 'deleteUser', {'memberId': memberId});

  _ida.Future<List<_ionzmxtq.NotificationDelivery>> getNotificationDeliveries({
    required int limit,
    required int offset,
    String? statusFilter,
  }) => caller.callServerEndpoint<List<_ionzmxtq.NotificationDelivery>>(
    'admin',
    'getNotificationDeliveries',
    {'limit': limit, 'offset': offset, 'statusFilter': statusFilter},
  );

  _ida.Future<void> clearNotificationDeliveries() => caller
      .callServerEndpoint<void>('admin', 'clearNotificationDeliveries', {});

  _ida.Future<void> retryFailedNotifications() =>
      caller.callServerEndpoint<void>('admin', 'retryFailedNotifications', {});
}

/// {@category Endpoint}
class EndpointEvent extends _isc.EndpointRef {
  EndpointEvent(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'event';

  /// Creates a new event and assigns the creator as the default manager.
  ///
  /// [session] - The session object.
  /// [event] - The event to create.
  /// [additionalManagerIds] - Optional list of additional member IDs to assign as managers.
  ///
  /// todo: Do we want to explicitly set the default manager?
  _ida.Future<_ix4abnwg.Event> createEvent(
    _ix4abnwg.Event event, {
    List<_isc.UuidValue>? additionalManagerIds,
    required bool notifyNewEvent,
  }) => caller.callServerEndpoint<_ix4abnwg.Event>('event', 'createEvent', {
    'event': event,
    'additionalManagerIds': additionalManagerIds,
    'notifyNewEvent': notifyNewEvent,
  });

  _ida.Future<_ix4abnwg.Event> getEvent(_isc.UuidValue id) => caller
      .callServerEndpoint<_ix4abnwg.Event>('event', 'getEvent', {'id': id});

  _ida.Future<_ix4abnwg.Event> updateEvent(_ix4abnwg.Event event) =>
      caller.callServerEndpoint<_ix4abnwg.Event>('event', 'updateEvent', {
        'event': event,
      });

  _ida.Future<void> deleteEvent(_isc.UuidValue id) =>
      caller.callServerEndpoint<void>('event', 'deleteEvent', {'id': id});

  _ida.Future<List<_ix4abnwg.Event>> listEvents({
    _isc.UuidValue? sectionId,
    DateTime? startTime,
    DateTime? endTime,
    required bool onlyMyEvents,
    DateTime? sinceLastUpdateTime,
  }) =>
      caller.callServerEndpoint<List<_ix4abnwg.Event>>('event', 'listEvents', {
        'sectionId': sectionId,
        'startTime': startTime,
        'endTime': endTime,
        'onlyMyEvents': onlyMyEvents,
        'sinceLastUpdateTime': sinceLastUpdateTime,
      });

  _ida.Future<_isud34nx.EventRegistration> registerForEvent(
    _isc.UuidValue eventId,
  ) => caller.callServerEndpoint<_isud34nx.EventRegistration>(
    'event',
    'registerForEvent',
    {'eventId': eventId},
  );
}

/// {@category Endpoint}
class EndpointEventManager extends _isc.EndpointRef {
  EndpointEventManager(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'eventManager';

  _ida.Future<_iygn3jma.EventManager> assignEventManager(
    _iygn3jma.EventManager eventManager,
  ) => caller.callServerEndpoint<_iygn3jma.EventManager>(
    'eventManager',
    'assignEventManager',
    {'eventManager': eventManager},
  );

  _ida.Future<void> removeEventManager(_iygn3jma.EventManager eventManager) =>
      caller.callServerEndpoint<void>('eventManager', 'removeEventManager', {
        'eventManager': eventManager,
      });

  /// Add a member to an event on behalf of an event manager.
  /// The calling user must be an event manager for this event.
  _ida.Future<_isud34nx.EventRegistration> addMemberToEvent(
    _isc.UuidValue eventId,
    _isc.UuidValue memberId,
  ) => caller.callServerEndpoint<_isud34nx.EventRegistration>(
    'eventManager',
    'addMemberToEvent',
    {'eventId': eventId, 'memberId': memberId},
  );

  /// Remove a member from an event on behalf of an event manager.
  /// The calling user must be an event manager for the related event.
  _ida.Future<void> removeMemberFromEvent(_isc.UuidValue registrationId) =>
      caller.callServerEndpoint<void>('eventManager', 'removeMemberFromEvent', {
        'registrationId': registrationId,
      });

  _ida.Future<List<_iygn3jma.EventManager>> listEventManagers(
    _isc.UuidValue eventId,
  ) => caller.callServerEndpoint<List<_iygn3jma.EventManager>>(
    'eventManager',
    'listEventManagers',
    {'eventId': eventId},
  );

  _ida.Future<List<_ix4abnwg.Event>> listEventManagerEvents(
    _isc.UuidValue memberId,
  ) => caller.callServerEndpoint<List<_ix4abnwg.Event>>(
    'eventManager',
    'listEventManagerEvents',
    {'memberId': memberId},
  );

  /// List events in a section that have no event managers assigned
  _ida.Future<List<_ix4abnwg.Event>> listEventsWithoutEventManager(
    _isc.UuidValue sectionId,
  ) => caller.callServerEndpoint<List<_ix4abnwg.Event>>(
    'eventManager',
    'listEventsWithoutEventManager',
    {'sectionId': sectionId},
  );

  /// List all event managers for events in a section
  _ida.Future<List<_iygn3jma.EventManager>> listSectionEventManagers(
    _isc.UuidValue sectionId,
  ) => caller.callServerEndpoint<List<_iygn3jma.EventManager>>(
    'eventManager',
    'listSectionEventManagers',
    {'sectionId': sectionId},
  );

  /// Approve a waitlisted registration, moving it to confirmed.
  /// The calling user must be an event manager for the event.
  _ida.Future<_isud34nx.EventRegistration> approveRegistration(
    _isc.UuidValue registrationId,
  ) => caller.callServerEndpoint<_isud34nx.EventRegistration>(
    'eventManager',
    'approveRegistration',
    {'registrationId': registrationId},
  );
}

/// {@category Endpoint}
class EndpointEventTemplate extends _isc.EndpointRef {
  EndpointEventTemplate(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'eventTemplate';

  /// Fetches all event templates from the database.
  _ida.Future<List<_imjavx7o.EventTemplate>> listTemplates() =>
      caller.callServerEndpoint<List<_imjavx7o.EventTemplate>>(
        'eventTemplate',
        'listTemplates',
        {},
      );

  /// Creates a new event template. Requires Admin scope.
  _ida.Future<_imjavx7o.EventTemplate> createTemplate(
    _imjavx7o.EventTemplate template,
  ) => caller.callServerEndpoint<_imjavx7o.EventTemplate>(
    'eventTemplate',
    'createTemplate',
    {'template': template},
  );

  /// Updates an existing event template. Requires Admin scope.
  _ida.Future<_imjavx7o.EventTemplate> updateTemplate(
    _imjavx7o.EventTemplate template,
  ) => caller.callServerEndpoint<_imjavx7o.EventTemplate>(
    'eventTemplate',
    'updateTemplate',
    {'template': template},
  );

  /// Deletes an event template. Requires Admin scope.
  _ida.Future<void> deleteTemplate(_isc.UuidValue id) => caller
      .callServerEndpoint<void>('eventTemplate', 'deleteTemplate', {'id': id});
}

/// {@category Endpoint}
class EndpointMember extends _isc.EndpointRef {
  EndpointMember(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'member';

  _ida.Future<_ixkkgnmw.Member?> getCurrentMember() => caller
      .callServerEndpoint<_ixkkgnmw.Member?>('member', 'getCurrentMember', {});

  /// Create a new member.
  ///
  /// - Validates that the email is not already in use.
  /// - Sets `createdAt` to now.
  /// - Inserts the member row and invalidates the member cache.
  _ida.Future<_ixkkgnmw.Member> createMember(_ixkkgnmw.Member member) =>
      caller.callServerEndpoint<_ixkkgnmw.Member>('member', 'createMember', {
        'member': member,
      });

  _ida.Future<_ikapn372.SectionMembership> addMemberToSection(
    _ikapn372.SectionMembership membership,
  ) => caller.callServerEndpoint<_ikapn372.SectionMembership>(
    'member',
    'addMemberToSection',
    {'membership': membership},
  );

  _ida.Future<void> removeMemberFromSection(
    _ikapn372.SectionMembership membership,
  ) => caller.callServerEndpoint<void>('member', 'removeMemberFromSection', {
    'membership': membership,
  });

  _ida.Future<_ixkkgnmw.Member?> getMember(_isc.UuidValue id) => caller
      .callServerEndpoint<_ixkkgnmw.Member?>('member', 'getMember', {'id': id});

  /// Return a list of all sections the member belongs to.
  _ida.Future<List<_ikapn372.SectionMembership>> getMemberSectionMemberships(
    _isc.UuidValue memberId,
  ) => caller.callServerEndpoint<List<_ikapn372.SectionMembership>>(
    'member',
    'getMemberSectionMemberships',
    {'memberId': memberId},
  );

  _ida.Future<_ixkkgnmw.Member> updateMember(_ixkkgnmw.Member member) =>
      caller.callServerEndpoint<_ixkkgnmw.Member>('member', 'updateMember', {
        'member': member,
      });

  /// Mark the current member's waiver as signed today.
  _ida.Future<_ixkkgnmw.Member> acceptWaiver() =>
      caller.callServerEndpoint<_ixkkgnmw.Member>('member', 'acceptWaiver', {});

  /// Returns members for a section, or all members the caller has access to
  /// if [sectionId] is null.
  ///
  /// When [sectionId] is null:
  /// - Global admins see all members.
  /// - Regular users see members across all their sections (deduplicated).
  ///
  /// Use [offset] for pagination — pass `offset: page * limit` to load successive pages.
  _ida.Future<List<_ixkkgnmw.Member>> getSectionMembers({
    _isc.UuidValue? sectionId,
    String? filter,
    required int limit,
    required int offset,
    DateTime? sinceLastUpdate,
  }) => caller.callServerEndpoint<List<_ixkkgnmw.Member>>(
    'member',
    'getSectionMembers',
    {
      'sectionId': sectionId,
      'filter': filter,
      'limit': limit,
      'offset': offset,
      'sinceLastUpdate': sinceLastUpdate,
    },
  );

  /// Return a list of section memberships for the given section id
  ///
  /// Similar to getSectionMembers but returns the actual membership records,
  /// which include the user's scopes for the section.
  ///
  /// Use [offset] for pagination — pass `offset: page * limit` to load successive pages.
  _ida.Future<List<_ikapn372.SectionMembership>> getSectionMemberships(
    _isc.UuidValue sectionId, {
    String? filter,
    required int limit,
    required int offset,
  }) => caller.callServerEndpoint<List<_ikapn372.SectionMembership>>(
    'member',
    'getSectionMemberships',
    {
      'sectionId': sectionId,
      'filter': filter,
      'limit': limit,
      'offset': offset,
    },
  );

  /// Get the active user's membership details (and scopes) for a specific section.
  _ida.Future<_ikapn372.SectionMembership?> getMySectionMembership(
    _isc.UuidValue sectionId,
  ) => caller.callServerEndpoint<_ikapn372.SectionMembership?>(
    'member',
    'getMySectionMembership',
    {'sectionId': sectionId},
  );

  /// Get all the active user's membership details across all sections.
  _ida.Future<List<_ikapn372.SectionMembership>> getAllMySectionMemberships() =>
      caller.callServerEndpoint<List<_ikapn372.SectionMembership>>(
        'member',
        'getAllMySectionMemberships',
        {},
      );

  /// Update a member's scopes for a specific section.
  /// Requires the caller to be a global admin or a section manager for the section.
  _ida.Future<_ikapn372.SectionMembership> updateMemberScopes(
    _isc.UuidValue memberId,
    _isc.UuidValue sectionId,
    Set<String> newScopes,
  ) => caller.callServerEndpoint<_ikapn372.SectionMembership>(
    'member',
    'updateMemberScopes',
    {'memberId': memberId, 'sectionId': sectionId, 'newScopes': newScopes},
  );

  /// Atomic registration: creates a Member profile and multiple Section memberships.
  _ida.Future<_ixkkgnmw.Member> registerMember(
    _ixkkgnmw.Member member,
    List<_isc.UuidValue> sectionIds,
  ) => caller.callServerEndpoint<_ixkkgnmw.Member>('member', 'registerMember', {
    'member': member,
    'sectionIds': sectionIds,
  });

  _ida.Future<void> setMemberProfileUrl(String imageUrl) =>
      caller.callServerEndpoint<void>('member', 'setMemberProfileUrl', {
        'imageUrl': imageUrl,
      });
}

/// {@category Endpoint}
class EndpointNotification extends _isc.EndpointRef {
  EndpointNotification(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'notification';

  _ida.Future<List<_i9cwoz9c.UserNotification>> getMyFeed({
    required int limit,
    required int offset,
  }) => caller.callServerEndpoint<List<_i9cwoz9c.UserNotification>>(
    'notification',
    'getMyFeed',
    {'limit': limit, 'offset': offset},
  );

  /// Delete all the notifications for the current user
  _ida.Future<void> deleteAll() =>
      caller.callServerEndpoint<void>('notification', 'deleteAll', {});

  _ida.Future<bool> markAsRead(_isc.UuidValue userNotificationId) =>
      caller.callServerEndpoint<bool>('notification', 'markAsRead', {
        'userNotificationId': userNotificationId,
      });

  _ida.Future<_i3sx7kqh.UserNotificationPreference> getMyPreferences() =>
      caller.callServerEndpoint<_i3sx7kqh.UserNotificationPreference>(
        'notification',
        'getMyPreferences',
        {},
      );

  _ida.Future<_i3sx7kqh.UserNotificationPreference> savePreference(
    _i3sx7kqh.UserNotificationPreference preference,
  ) => caller.callServerEndpoint<_i3sx7kqh.UserNotificationPreference>(
    'notification',
    'savePreference',
    {'preference': preference},
  );

  _ida.Future<void> registerFcmToken(String token, {String? deviceId}) =>
      caller.callServerEndpoint<void>('notification', 'registerFcmToken', {
        'token': token,
        'deviceId': deviceId,
      });
}

/// {@category Endpoint}
class EndpointRegistration extends _isc.EndpointRef {
  EndpointRegistration(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'registration';

  /// Approve or reject a registration
  _ida.Future<_isud34nx.EventRegistration> updateRegistrationStatus(
    _isc.UuidValue registrationId,
    _i6udvzgc.RegistrationStatus newStatus, {
    String? notes,
  }) => caller.callServerEndpoint<_isud34nx.EventRegistration>(
    'registration',
    'updateRegistrationStatus',
    {'registrationId': registrationId, 'newStatus': newStatus, 'notes': notes},
  );

  _ida.Future<_isud34nx.EventRegistration> registerForEvent(
    _isud34nx.EventRegistration registration,
  ) => caller.callServerEndpoint<_isud34nx.EventRegistration>(
    'registration',
    'registerForEvent',
    {'registration': registration},
  );

  _ida.Future<void> cancelRegistration(_isc.UuidValue registrationId) =>
      caller.callServerEndpoint<void>('registration', 'cancelRegistration', {
        'registrationId': registrationId,
      });

  _ida.Future<List<_isud34nx.EventRegistration>> getRegistrationsForEvent(
    _isc.UuidValue eventId,
  ) => caller.callServerEndpoint<List<_isud34nx.EventRegistration>>(
    'registration',
    'getRegistrationsForEvent',
    {'eventId': eventId},
  );
}

/// {@category Endpoint}
class EndpointSection extends _isc.EndpointRef {
  EndpointSection(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'section';

  _ida.Future<_i7dvc5iw.Section?> getSection(_isc.UuidValue id) =>
      caller.callServerEndpoint<_i7dvc5iw.Section?>('section', 'getSection', {
        'id': id,
      });

  _ida.Future<List<_i7dvc5iw.Section>> listSections() =>
      caller.callServerEndpoint<List<_i7dvc5iw.Section>>(
        'section',
        'listSections',
        {},
      );

  _ida.Future<List<_i7dvc5iw.Section>> getSectionsForCurrentUser() =>
      caller.callServerEndpoint<List<_i7dvc5iw.Section>>(
        'section',
        'getSectionsForCurrentUser',
        {},
      );
}

/// Endpoint to view and edit the signed-in user's profile.
/// {@category Endpoint}
class EndpointUserProfile extends _iacc.EndpointUserProfileEditBase {
  EndpointUserProfile(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'userProfile';

  @override
  _ida.Future<_iacc.UserProfileModel> setUserImage(_idt.ByteData image) =>
      caller.callServerEndpoint<_iacc.UserProfileModel>(
        'userProfile',
        'setUserImage',
        {'image': image},
      );

  /// Removes the user's uploaded image, setting it to null.
  ///
  /// The client should handle displaying a placeholder for users without images.
  @override
  _ida.Future<_iacc.UserProfileModel> removeUserImage() =>
      caller.callServerEndpoint<_iacc.UserProfileModel>(
        'userProfile',
        'removeUserImage',
        {},
      );

  /// Changes the name of a user.
  @override
  _ida.Future<_iacc.UserProfileModel> changeUserName(String? userName) =>
      caller.callServerEndpoint<_iacc.UserProfileModel>(
        'userProfile',
        'changeUserName',
        {'userName': userName},
      );

  /// Changes the full name of a user.
  @override
  _ida.Future<_iacc.UserProfileModel> changeFullName(String? fullName) =>
      caller.callServerEndpoint<_iacc.UserProfileModel>(
        'userProfile',
        'changeFullName',
        {'fullName': fullName},
      );

  /// Returns the user profile of the current user.
  @override
  _ida.Future<_iacc.UserProfileModel> get() => caller
      .callServerEndpoint<_iacc.UserProfileModel>('userProfile', 'get', {});
}

class Modules {
  Modules(Client client) {
    serverpod_auth_idp = _iaic.Caller(client);
    serverpod_auth_core = _iacc.Caller(client);
  }

  late final _iaic.Caller serverpod_auth_idp;

  late final _iacc.Caller serverpod_auth_core;
}

class Client extends _isc.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(_isc.MethodCallContext, Object, StackTrace)? onFailedCall,
    Function(_isc.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
    _i85jenna.Client? httpClientOverride,
  }) : super(
         host,
         _il2as5qe.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
         httpClientOverride: httpClientOverride,
       ) {
    emailIdp = EndpointEmailIdp(this);
    refreshJwtTokens = EndpointRefreshJwtTokens(this);
    googleIdp = EndpointGoogleIdp(this);
    facebookIdp = EndpointFacebookIdp(this);
    admin = EndpointAdmin(this);
    event = EndpointEvent(this);
    eventManager = EndpointEventManager(this);
    eventTemplate = EndpointEventTemplate(this);
    member = EndpointMember(this);
    notification = EndpointNotification(this);
    registration = EndpointRegistration(this);
    section = EndpointSection(this);
    userProfile = EndpointUserProfile(this);
    modules = Modules(this);
  }

  late final EndpointEmailIdp emailIdp;

  late final EndpointRefreshJwtTokens refreshJwtTokens;

  late final EndpointGoogleIdp googleIdp;

  late final EndpointFacebookIdp facebookIdp;

  late final EndpointAdmin admin;

  late final EndpointEvent event;

  late final EndpointEventManager eventManager;

  late final EndpointEventTemplate eventTemplate;

  late final EndpointMember member;

  late final EndpointNotification notification;

  late final EndpointRegistration registration;

  late final EndpointSection section;

  late final EndpointUserProfile userProfile;

  late final Modules modules;

  @override
  Map<String, _isc.EndpointRef> get endpointRefLookup => {
    'emailIdp': emailIdp,
    'refreshJwtTokens': refreshJwtTokens,
    'googleIdp': googleIdp,
    'facebookIdp': facebookIdp,
    'admin': admin,
    'event': event,
    'eventManager': eventManager,
    'eventTemplate': eventTemplate,
    'member': member,
    'notification': notification,
    'registration': registration,
    'section': section,
    'userProfile': userProfile,
  };

  @override
  Map<String, _isc.ModuleEndpointCaller> get moduleLookup => {
    'serverpod_auth_idp': modules.serverpod_auth_idp,
    'serverpod_auth_core': modules.serverpod_auth_core,
  };

  /// Creates a new client-side database session for the given path.
  ///
  /// The [path] is the file path to the SQLite database file. Since SQLite uses
  /// WAL mode, note that `[path]-shm` and `[path]-wal` files might also exist
  /// transiently for the database while the session is open.
  ///
  /// If [runMigrations] is true, pending migrations will be applied when
  /// opening the database. Be careful when setting this to false, as it might
  /// lead to inconsistencies between the models and the database.
  ///
  /// If [isDebugMode] is true, the database integrity will be verified after
  /// the migrations are applied to provide feedback of possible issues. On a
  /// Flutter application, this should be set to [kDebugMode].
  _ida.Future<_isd.ClientDatabaseSession> createSession(
    String path, {
    bool runMigrations = true,
    bool isDebugMode = false,
  }) async {
    return await _isd.ClientDatabaseSession.open(
      path,
      _il2as5qe.Protocol(),
      clientMigrations: MigrationRegistry.migrations,
      runMigrations: runMigrations,
      isDebugMode: isDebugMode,
    );
  }
}
