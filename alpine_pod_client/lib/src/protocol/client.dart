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
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i1;
import 'package:serverpod_client/serverpod_client.dart' as _i2;
import 'dart:async' as _i3;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i4;
import 'package:alpine_pod_client/src/protocol/section.dart' as _i5;
import 'package:alpine_pod_client/src/protocol/member.dart' as _i6;
import 'package:alpine_pod_client/src/protocol/notification_delivery.dart'
    as _i7;
import 'package:alpine_pod_client/src/protocol/event.dart' as _i8;
import 'package:alpine_pod_client/src/protocol/event_registration.dart' as _i9;
import 'package:alpine_pod_client/src/protocol/event_manager.dart' as _i10;
import 'package:alpine_pod_client/src/protocol/event_template.dart' as _i11;
import 'package:alpine_pod_client/src/protocol/section_membership.dart' as _i12;
import 'package:alpine_pod_client/src/protocol/user_notification.dart' as _i13;
import 'package:alpine_pod_client/src/protocol/user_notification_preference.dart'
    as _i14;
import 'package:alpine_pod_client/src/protocol/registration_status.dart'
    as _i15;
import 'dart:typed_data' as _i16;
import 'package:http/http.dart' as _i17;
import 'protocol.dart' as _i18;

/// {@category Endpoint}
class EndpointEmailIdp extends _i1.EndpointEmailIdpBase {
  EndpointEmailIdp(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'emailIdp';

  @override
  _i3.Future<_i4.AuthSuccess> login({
    required String email,
    required String password,
  }) => caller.callServerEndpoint<_i4.AuthSuccess>(
    'emailIdp',
    'login',
    {
      'email': email,
      'password': password,
    },
  );

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
  _i3.Future<_i2.UuidValue> startRegistration({required String email}) =>
      caller.callServerEndpoint<_i2.UuidValue>(
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
  _i3.Future<String> verifyRegistrationCode({
    required _i2.UuidValue accountRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyRegistrationCode',
    {
      'accountRequestId': accountRequestId,
      'verificationCode': verificationCode,
    },
  );

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
  _i3.Future<_i4.AuthSuccess> finishRegistration({
    required String registrationToken,
    required String password,
  }) => caller.callServerEndpoint<_i4.AuthSuccess>(
    'emailIdp',
    'finishRegistration',
    {
      'registrationToken': registrationToken,
      'password': password,
    },
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
  _i3.Future<_i2.UuidValue> startPasswordReset({required String email}) =>
      caller.callServerEndpoint<_i2.UuidValue>(
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
  _i3.Future<String> verifyPasswordResetCode({
    required _i2.UuidValue passwordResetRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyPasswordResetCode',
    {
      'passwordResetRequestId': passwordResetRequestId,
      'verificationCode': verificationCode,
    },
  );

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
  _i3.Future<void> finishPasswordReset({
    required String finishPasswordResetToken,
    required String newPassword,
  }) => caller.callServerEndpoint<void>(
    'emailIdp',
    'finishPasswordReset',
    {
      'finishPasswordResetToken': finishPasswordResetToken,
      'newPassword': newPassword,
    },
  );

  @override
  _i3.Future<bool> hasAccount() => caller.callServerEndpoint<bool>(
    'emailIdp',
    'hasAccount',
    {},
  );
}

/// {@category Endpoint}
class EndpointRefreshJwtTokens extends _i4.EndpointRefreshJwtTokens {
  EndpointRefreshJwtTokens(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'refreshJwtTokens';

  /// Creates a new token pair for the given [refreshToken].
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
  _i3.Future<_i4.AuthSuccess> refreshAccessToken({
    required String refreshToken,
  }) => caller.callServerEndpoint<_i4.AuthSuccess>(
    'refreshJwtTokens',
    'refreshAccessToken',
    {'refreshToken': refreshToken},
    authenticated: false,
  );
}

/// {@category Endpoint}
class EndpointGoogleIdp extends _i1.EndpointGoogleIdpBase {
  EndpointGoogleIdp(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'googleIdp';

  @override
  _i3.Future<_i4.AuthSuccess> login({
    required String idToken,
    required String? accessToken,
  }) => caller.callServerEndpoint<_i4.AuthSuccess>(
    'googleIdp',
    'login',
    {
      'idToken': idToken,
      'accessToken': accessToken,
    },
  );

  /// Validates a Google authorization code from the web OAuth2 PKCE flow and
  /// either logs in the associated user or creates a new account.
  ///
  /// This is the web counterpart of [login], which accepts an ID token directly
  /// (used on native platforms via the `google_sign_in` package).
  ///
  /// If a new user is created an associated [UserProfile] is also created.
  @override
  _i3.Future<_i4.AuthSuccess> loginWithCode({
    required String code,
    required String codeVerifier,
    required String redirectUri,
  }) => caller.callServerEndpoint<_i4.AuthSuccess>(
    'googleIdp',
    'loginWithCode',
    {
      'code': code,
      'codeVerifier': codeVerifier,
      'redirectUri': redirectUri,
    },
  );

  @override
  _i3.Future<bool> hasAccount() => caller.callServerEndpoint<bool>(
    'googleIdp',
    'hasAccount',
    {},
  );
}

/// {@category Endpoint}
class EndpointFacebookIdp extends _i1.EndpointFacebookIdpBase {
  EndpointFacebookIdp(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'facebookIdp';

  /// Validates a Facebook access token and either logs in the associated user or
  /// creates a new user account if the Facebook account ID is not yet known.
  ///
  /// If the access token is invalid or expired, the
  /// [FacebookAccessTokenVerificationException] will be thrown.
  @override
  _i3.Future<_i4.AuthSuccess> login({required String accessToken}) =>
      caller.callServerEndpoint<_i4.AuthSuccess>(
        'facebookIdp',
        'login',
        {'accessToken': accessToken},
      );

  @override
  _i3.Future<bool> hasAccount() => caller.callServerEndpoint<bool>(
    'facebookIdp',
    'hasAccount',
    {},
  );
}

/// {@category Endpoint}
class EndpointAdmin extends _i2.EndpointRef {
  EndpointAdmin(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'admin';

  /// Section Management
  _i3.Future<_i5.Section> createSection(_i5.Section section) =>
      caller.callServerEndpoint<_i5.Section>(
        'admin',
        'createSection',
        {'section': section},
      );

  _i3.Future<_i5.Section?> getSection(int id) =>
      caller.callServerEndpoint<_i5.Section?>(
        'admin',
        'getSection',
        {'id': id},
      );

  _i3.Future<_i5.Section> updateSection(_i5.Section section) =>
      caller.callServerEndpoint<_i5.Section>(
        'admin',
        'updateSection',
        {'section': section},
      );

  _i3.Future<void> deleteSection(int id) => caller.callServerEndpoint<void>(
    'admin',
    'deleteSection',
    {'id': id},
  );

  _i3.Future<List<_i5.Section>> listSections() =>
      caller.callServerEndpoint<List<_i5.Section>>(
        'admin',
        'listSections',
        {},
      );

  _i3.Future<_i6.Member?> getMember(int id) =>
      caller.callServerEndpoint<_i6.Member?>(
        'admin',
        'getMember',
        {'id': id},
      );

  _i3.Future<void> deleteUser(int memberId) => caller.callServerEndpoint<void>(
    'admin',
    'deleteUser',
    {'memberId': memberId},
  );

  _i3.Future<List<_i7.NotificationDelivery>> getNotificationDeliveries({
    required int limit,
    required int offset,
    String? statusFilter,
  }) => caller.callServerEndpoint<List<_i7.NotificationDelivery>>(
    'admin',
    'getNotificationDeliveries',
    {
      'limit': limit,
      'offset': offset,
      'statusFilter': statusFilter,
    },
  );

  _i3.Future<void> clearNotificationDeliveries() =>
      caller.callServerEndpoint<void>(
        'admin',
        'clearNotificationDeliveries',
        {},
      );

  _i3.Future<void> retryFailedNotifications() =>
      caller.callServerEndpoint<void>(
        'admin',
        'retryFailedNotifications',
        {},
      );
}

/// {@category Endpoint}
class EndpointEvent extends _i2.EndpointRef {
  EndpointEvent(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'event';

  /// Creates a new event and assigns the creator as the default manager.
  ///
  /// [session] - The session object.
  /// [event] - The event to create.
  /// [additionalManagerIds] - Optional list of additional member IDs to assign as managers.
  ///
  /// todo: Do we want to explicitly set the default manager?
  _i3.Future<_i8.Event> createEvent(
    _i8.Event event, {
    List<int>? additionalManagerIds,
    required bool notifyNewEvent,
  }) => caller.callServerEndpoint<_i8.Event>(
    'event',
    'createEvent',
    {
      'event': event,
      'additionalManagerIds': additionalManagerIds,
      'notifyNewEvent': notifyNewEvent,
    },
  );

  _i3.Future<_i8.Event> getEvent(int id) =>
      caller.callServerEndpoint<_i8.Event>(
        'event',
        'getEvent',
        {'id': id},
      );

  _i3.Future<_i8.Event> updateEvent(_i8.Event event) =>
      caller.callServerEndpoint<_i8.Event>(
        'event',
        'updateEvent',
        {'event': event},
      );

  _i3.Future<void> deleteEvent(int id) => caller.callServerEndpoint<void>(
    'event',
    'deleteEvent',
    {'id': id},
  );

  _i3.Future<List<_i8.Event>> listEvents(
    int? sectionId,
    DateTime? startTime,
    DateTime? endTime,
    bool? onlyMyEvents,
  ) => caller.callServerEndpoint<List<_i8.Event>>(
    'event',
    'listEvents',
    {
      'sectionId': sectionId,
      'startTime': startTime,
      'endTime': endTime,
      'onlyMyEvents': onlyMyEvents,
    },
  );

  _i3.Future<_i9.EventRegistration> registerForEvent(int eventId) =>
      caller.callServerEndpoint<_i9.EventRegistration>(
        'event',
        'registerForEvent',
        {'eventId': eventId},
      );
}

/// {@category Endpoint}
class EndpointEventManager extends _i2.EndpointRef {
  EndpointEventManager(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'eventManager';

  _i3.Future<_i10.EventManager> assignEventManager(
    _i10.EventManager eventManager,
  ) => caller.callServerEndpoint<_i10.EventManager>(
    'eventManager',
    'assignEventManager',
    {'eventManager': eventManager},
  );

  _i3.Future<void> removeEventManager(_i10.EventManager eventManager) =>
      caller.callServerEndpoint<void>(
        'eventManager',
        'removeEventManager',
        {'eventManager': eventManager},
      );

  /// Add a member to an event on behalf of an event manager.
  /// The calling user must be an event manager for this event.
  _i3.Future<_i9.EventRegistration> addMemberToEvent(
    int eventId,
    int memberId,
  ) => caller.callServerEndpoint<_i9.EventRegistration>(
    'eventManager',
    'addMemberToEvent',
    {
      'eventId': eventId,
      'memberId': memberId,
    },
  );

  /// Remove a member from an event on behalf of an event manager.
  /// The calling user must be an event manager for the related event.
  _i3.Future<void> removeMemberFromEvent(int registrationId) =>
      caller.callServerEndpoint<void>(
        'eventManager',
        'removeMemberFromEvent',
        {'registrationId': registrationId},
      );

  _i3.Future<List<_i10.EventManager>> listEventManagers(int eventId) =>
      caller.callServerEndpoint<List<_i10.EventManager>>(
        'eventManager',
        'listEventManagers',
        {'eventId': eventId},
      );

  _i3.Future<List<_i8.Event>> listEventManagerEvents(int memberId) =>
      caller.callServerEndpoint<List<_i8.Event>>(
        'eventManager',
        'listEventManagerEvents',
        {'memberId': memberId},
      );

  /// List events in a section that have no event managers assigned
  _i3.Future<List<_i8.Event>> listEventsWithoutEventManager(int sectionId) =>
      caller.callServerEndpoint<List<_i8.Event>>(
        'eventManager',
        'listEventsWithoutEventManager',
        {'sectionId': sectionId},
      );

  /// List all event managers for events in a section
  _i3.Future<List<_i10.EventManager>> listSectionEventManagers(int sectionId) =>
      caller.callServerEndpoint<List<_i10.EventManager>>(
        'eventManager',
        'listSectionEventManagers',
        {'sectionId': sectionId},
      );

  /// Approve a waitlisted registration, moving it to confirmed.
  /// The calling user must be an event manager for the event.
  _i3.Future<_i9.EventRegistration> approveRegistration(int registrationId) =>
      caller.callServerEndpoint<_i9.EventRegistration>(
        'eventManager',
        'approveRegistration',
        {'registrationId': registrationId},
      );
}

/// {@category Endpoint}
class EndpointEventTemplate extends _i2.EndpointRef {
  EndpointEventTemplate(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'eventTemplate';

  /// Fetches all event templates from the database.
  _i3.Future<List<_i11.EventTemplate>> listTemplates() =>
      caller.callServerEndpoint<List<_i11.EventTemplate>>(
        'eventTemplate',
        'listTemplates',
        {},
      );

  /// Creates a new event template. Requires Admin scope.
  _i3.Future<_i11.EventTemplate> createTemplate(_i11.EventTemplate template) =>
      caller.callServerEndpoint<_i11.EventTemplate>(
        'eventTemplate',
        'createTemplate',
        {'template': template},
      );

  /// Updates an existing event template. Requires Admin scope.
  _i3.Future<_i11.EventTemplate> updateTemplate(_i11.EventTemplate template) =>
      caller.callServerEndpoint<_i11.EventTemplate>(
        'eventTemplate',
        'updateTemplate',
        {'template': template},
      );

  /// Deletes an event template. Requires Admin scope.
  _i3.Future<void> deleteTemplate(int id) => caller.callServerEndpoint<void>(
    'eventTemplate',
    'deleteTemplate',
    {'id': id},
  );
}

/// {@category Endpoint}
class EndpointMember extends _i2.EndpointRef {
  EndpointMember(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'member';

  _i3.Future<_i6.Member?> getCurrentMember() =>
      caller.callServerEndpoint<_i6.Member?>(
        'member',
        'getCurrentMember',
        {},
      );

  /// Create a new member.
  ///
  /// - Validates that the email is not already in use.
  /// - Sets `createdAt` to now.
  /// - Inserts the member row and invalidates the member cache.
  _i3.Future<_i6.Member> createMember(_i6.Member member) =>
      caller.callServerEndpoint<_i6.Member>(
        'member',
        'createMember',
        {'member': member},
      );

  _i3.Future<_i12.SectionMembership> addMemberToSection(
    _i12.SectionMembership membership,
  ) => caller.callServerEndpoint<_i12.SectionMembership>(
    'member',
    'addMemberToSection',
    {'membership': membership},
  );

  _i3.Future<void> removeMemberFromSection(_i12.SectionMembership membership) =>
      caller.callServerEndpoint<void>(
        'member',
        'removeMemberFromSection',
        {'membership': membership},
      );

  _i3.Future<_i6.Member?> getMember(int id) =>
      caller.callServerEndpoint<_i6.Member?>(
        'member',
        'getMember',
        {'id': id},
      );

  /// Return a list of all sections the member belongs to.
  _i3.Future<List<_i12.SectionMembership>> getMemberSectionMemberships(
    int memberId,
  ) => caller.callServerEndpoint<List<_i12.SectionMembership>>(
    'member',
    'getMemberSectionMemberships',
    {'memberId': memberId},
  );

  _i3.Future<_i6.Member> updateMember(_i6.Member member) =>
      caller.callServerEndpoint<_i6.Member>(
        'member',
        'updateMember',
        {'member': member},
      );

  /// Mark the current member's waiver as signed today.
  _i3.Future<_i6.Member> acceptWaiver() =>
      caller.callServerEndpoint<_i6.Member>(
        'member',
        'acceptWaiver',
        {},
      );

  /// Returns members for a section, or all members the caller has access to
  /// if [sectionId] is null.
  ///
  /// When [sectionId] is null:
  /// - Global admins see all members.
  /// - Regular users see members across all their sections (deduplicated).
  ///
  /// Use [offset] for pagination — pass `offset: page * limit` to load successive pages.
  _i3.Future<List<_i6.Member>> getSectionMembers({
    int? sectionId,
    String? filter,
    required int limit,
    required int offset,
  }) => caller.callServerEndpoint<List<_i6.Member>>(
    'member',
    'getSectionMembers',
    {
      'sectionId': sectionId,
      'filter': filter,
      'limit': limit,
      'offset': offset,
    },
  );

  /// Return a list of section memberships for the given section id
  ///
  /// Similar to getSectionMembers but returns the actual membership records,
  /// which include the user's scopes for the section.
  ///
  /// Use [offset] for pagination — pass `offset: page * limit` to load successive pages.
  _i3.Future<List<_i12.SectionMembership>> getSectionMemberships(
    int sectionId, {
    String? filter,
    required int limit,
    required int offset,
  }) => caller.callServerEndpoint<List<_i12.SectionMembership>>(
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
  _i3.Future<_i12.SectionMembership?> getMySectionMembership(int sectionId) =>
      caller.callServerEndpoint<_i12.SectionMembership?>(
        'member',
        'getMySectionMembership',
        {'sectionId': sectionId},
      );

  /// Get all the active user's membership details across all sections.
  _i3.Future<List<_i12.SectionMembership>> getAllMySectionMemberships() =>
      caller.callServerEndpoint<List<_i12.SectionMembership>>(
        'member',
        'getAllMySectionMemberships',
        {},
      );

  /// Update a member's scopes for a specific section.
  /// Requires the caller to be a global admin or a section manager for the section.
  _i3.Future<_i12.SectionMembership> updateMemberScopes(
    int memberId,
    int sectionId,
    Set<String> newScopes,
  ) => caller.callServerEndpoint<_i12.SectionMembership>(
    'member',
    'updateMemberScopes',
    {
      'memberId': memberId,
      'sectionId': sectionId,
      'newScopes': newScopes,
    },
  );

  /// Atomic registration: creates a Member profile and multiple Section memberships.
  _i3.Future<_i6.Member> registerMember(
    _i6.Member member,
    List<int> sectionIds,
  ) => caller.callServerEndpoint<_i6.Member>(
    'member',
    'registerMember',
    {
      'member': member,
      'sectionIds': sectionIds,
    },
  );
}

/// {@category Endpoint}
class EndpointNotification extends _i2.EndpointRef {
  EndpointNotification(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'notification';

  _i3.Future<List<_i13.UserNotification>> getMyFeed({
    required int limit,
    required int offset,
  }) => caller.callServerEndpoint<List<_i13.UserNotification>>(
    'notification',
    'getMyFeed',
    {
      'limit': limit,
      'offset': offset,
    },
  );

  /// Delete all the notifications for the current user
  _i3.Future<void> deleteAll() => caller.callServerEndpoint<void>(
    'notification',
    'deleteAll',
    {},
  );

  _i3.Future<bool> markAsRead(int userNotificationId) =>
      caller.callServerEndpoint<bool>(
        'notification',
        'markAsRead',
        {'userNotificationId': userNotificationId},
      );

  _i3.Future<_i14.UserNotificationPreference> getMyPreferences() =>
      caller.callServerEndpoint<_i14.UserNotificationPreference>(
        'notification',
        'getMyPreferences',
        {},
      );

  _i3.Future<_i14.UserNotificationPreference> savePreference(
    _i14.UserNotificationPreference preference,
  ) => caller.callServerEndpoint<_i14.UserNotificationPreference>(
    'notification',
    'savePreference',
    {'preference': preference},
  );

  _i3.Future<void> registerFcmToken(
    String token, {
    String? deviceId,
  }) => caller.callServerEndpoint<void>(
    'notification',
    'registerFcmToken',
    {
      'token': token,
      'deviceId': deviceId,
    },
  );
}

/// {@category Endpoint}
class EndpointRegistration extends _i2.EndpointRef {
  EndpointRegistration(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'registration';

  /// Approve or reject a registration
  _i3.Future<_i9.EventRegistration> updateRegistrationStatus(
    int registrationId,
    _i15.RegistrationStatus newStatus, {
    String? notes,
  }) => caller.callServerEndpoint<_i9.EventRegistration>(
    'registration',
    'updateRegistrationStatus',
    {
      'registrationId': registrationId,
      'newStatus': newStatus,
      'notes': notes,
    },
  );

  _i3.Future<_i9.EventRegistration> registerForEvent(
    _i9.EventRegistration registration,
  ) => caller.callServerEndpoint<_i9.EventRegistration>(
    'registration',
    'registerForEvent',
    {'registration': registration},
  );

  _i3.Future<void> cancelRegistration(int registrationId) =>
      caller.callServerEndpoint<void>(
        'registration',
        'cancelRegistration',
        {'registrationId': registrationId},
      );

  _i3.Future<List<_i9.EventRegistration>> getRegistrationsForEvent(
    int eventId,
  ) => caller.callServerEndpoint<List<_i9.EventRegistration>>(
    'registration',
    'getRegistrationsForEvent',
    {'eventId': eventId},
  );
}

/// {@category Endpoint}
class EndpointSection extends _i2.EndpointRef {
  EndpointSection(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'section';

  _i3.Future<_i5.Section?> getSection(int id) =>
      caller.callServerEndpoint<_i5.Section?>(
        'section',
        'getSection',
        {'id': id},
      );

  _i3.Future<List<_i5.Section>> listSections() =>
      caller.callServerEndpoint<List<_i5.Section>>(
        'section',
        'listSections',
        {},
      );

  _i3.Future<List<_i5.Section>> getSectionsForCurrentUser() =>
      caller.callServerEndpoint<List<_i5.Section>>(
        'section',
        'getSectionsForCurrentUser',
        {},
      );
}

/// Endpoint to view and edit the signed-in user's profile.
/// {@category Endpoint}
class EndpointUserProfile extends _i4.EndpointUserProfileEditBase {
  EndpointUserProfile(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'userProfile';

  /// Removes the user's uploaded image, setting it to null.
  ///
  /// The client should handle displaying a placeholder for users without images.
  @override
  _i3.Future<_i4.UserProfileModel> removeUserImage() =>
      caller.callServerEndpoint<_i4.UserProfileModel>(
        'userProfile',
        'removeUserImage',
        {},
      );

  /// Sets a new user image for the signed in user.
  @override
  _i3.Future<_i4.UserProfileModel> setUserImage(_i16.ByteData image) =>
      caller.callServerEndpoint<_i4.UserProfileModel>(
        'userProfile',
        'setUserImage',
        {'image': image},
      );

  /// Changes the name of a user.
  @override
  _i3.Future<_i4.UserProfileModel> changeUserName(String? userName) =>
      caller.callServerEndpoint<_i4.UserProfileModel>(
        'userProfile',
        'changeUserName',
        {'userName': userName},
      );

  /// Changes the full name of a user.
  @override
  _i3.Future<_i4.UserProfileModel> changeFullName(String? fullName) =>
      caller.callServerEndpoint<_i4.UserProfileModel>(
        'userProfile',
        'changeFullName',
        {'fullName': fullName},
      );

  /// Returns the user profile of the current user.
  @override
  _i3.Future<_i4.UserProfileModel> get() =>
      caller.callServerEndpoint<_i4.UserProfileModel>(
        'userProfile',
        'get',
        {},
      );
}

class Modules {
  Modules(Client client) {
    serverpod_auth_idp = _i1.Caller(client);
    serverpod_auth_core = _i4.Caller(client);
  }

  late final _i1.Caller serverpod_auth_idp;

  late final _i4.Caller serverpod_auth_core;
}

class Client extends _i2.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    @Deprecated(
      'Use authKeyProvider instead. This will be removed in future releases.',
    )
    super.authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i2.MethodCallContext,
      Object,
      StackTrace,
    )?
    onFailedCall,
    Function(_i2.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
    _i17.Client? httpClientOverride,
  }) : super(
         host,
         _i18.Protocol(),
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
  Map<String, _i2.EndpointRef> get endpointRefLookup => {
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
  Map<String, _i2.ModuleEndpointCaller> get moduleLookup => {
    'serverpod_auth_idp': modules.serverpod_auth_idp,
    'serverpod_auth_core': modules.serverpod_auth_core,
  };
}
