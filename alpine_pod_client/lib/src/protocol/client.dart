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
import 'package:alpine_pod_client/src/protocol/event.dart' as _i6;
import 'package:alpine_pod_client/src/protocol/event_registration.dart' as _i7;
import 'package:alpine_pod_client/src/protocol/event_manager.dart' as _i8;
import 'package:alpine_pod_client/src/protocol/member.dart' as _i9;
import 'package:alpine_pod_client/src/protocol/section_membership.dart' as _i10;
import 'package:alpine_pod_client/src/protocol/registration_status.dart'
    as _i11;
import 'protocol.dart' as _i12;

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
}

/// {@category Endpoint}
class EndpointEvent extends _i2.EndpointRef {
  EndpointEvent(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'event';

  _i3.Future<_i6.Event> createEvent(_i6.Event event) =>
      caller.callServerEndpoint<_i6.Event>(
        'event',
        'createEvent',
        {'event': event},
      );

  _i3.Future<_i6.Event> getEvent(int id) =>
      caller.callServerEndpoint<_i6.Event>(
        'event',
        'getEvent',
        {'id': id},
      );

  _i3.Future<_i6.Event> updateEvent(_i6.Event event) =>
      caller.callServerEndpoint<_i6.Event>(
        'event',
        'updateEvent',
        {'event': event},
      );

  _i3.Future<void> deleteEvent(int id) => caller.callServerEndpoint<void>(
    'event',
    'deleteEvent',
    {'id': id},
  );

  _i3.Future<List<_i6.Event>> listEvents(
    int? sectionId,
    DateTime? startTime,
    DateTime? endTime,
  ) => caller.callServerEndpoint<List<_i6.Event>>(
    'event',
    'listEvents',
    {
      'sectionId': sectionId,
      'startTime': startTime,
      'endTime': endTime,
    },
  );

  _i3.Future<_i7.EventRegistration> registerForEvent(int eventId) =>
      caller.callServerEndpoint<_i7.EventRegistration>(
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

  _i3.Future<_i8.EventManager> assignEventManager(
    _i8.EventManager eventManager,
  ) => caller.callServerEndpoint<_i8.EventManager>(
    'eventManager',
    'assignEventManager',
    {'eventManager': eventManager},
  );

  _i3.Future<void> removeEventManager(_i8.EventManager eventManager) =>
      caller.callServerEndpoint<void>(
        'eventManager',
        'removeEventManager',
        {'eventManager': eventManager},
      );

  /// Add a member to an event on behalf of an event manager.
  /// The calling user must be an event manager for this event.
  _i3.Future<_i7.EventRegistration> addMemberToEvent(
    int eventId,
    int memberId,
  ) => caller.callServerEndpoint<_i7.EventRegistration>(
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

  _i3.Future<List<_i8.EventManager>> listEventManagers(int eventId) =>
      caller.callServerEndpoint<List<_i8.EventManager>>(
        'eventManager',
        'listEventManagers',
        {'eventId': eventId},
      );

  _i3.Future<List<_i6.Event>> listEventManagerEvents(int memberId) =>
      caller.callServerEndpoint<List<_i6.Event>>(
        'eventManager',
        'listEventManagerEvents',
        {'memberId': memberId},
      );

  /// List events in a section that have no event managers assigned
  _i3.Future<List<_i6.Event>> listEventsWithoutEventManager(int sectionId) =>
      caller.callServerEndpoint<List<_i6.Event>>(
        'eventManager',
        'listEventsWithoutEventManager',
        {'sectionId': sectionId},
      );

  /// List all event managers for events in a section
  _i3.Future<List<_i8.EventManager>> listSectionEventManagers(int sectionId) =>
      caller.callServerEndpoint<List<_i8.EventManager>>(
        'eventManager',
        'listSectionEventManagers',
        {'sectionId': sectionId},
      );
}

/// TODO: Use RBAC to restrict access to these methods
/// {@category Endpoint}
class EndpointMember extends _i2.EndpointRef {
  EndpointMember(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'member';

  _i3.Future<_i9.Member?> getCurrentMember() =>
      caller.callServerEndpoint<_i9.Member?>(
        'member',
        'getCurrentMember',
        {},
      );

  _i3.Future<List<_i9.Member>> getMembers() =>
      caller.callServerEndpoint<List<_i9.Member>>(
        'member',
        'getMembers',
        {},
      );

  /// Create a new member.
  ///
  /// - Validates that the email is not already in use.
  /// - Sets `createdAt` to now.
  /// - Inserts the member row and invalidates the member cache.
  _i3.Future<_i9.Member> createMember(_i9.Member member) =>
      caller.callServerEndpoint<_i9.Member>(
        'member',
        'createMember',
        {'member': member},
      );

  _i3.Future<_i10.SectionMembership> addMemberToSection(
    _i10.SectionMembership membership,
  ) => caller.callServerEndpoint<_i10.SectionMembership>(
    'member',
    'addMemberToSection',
    {'membership': membership},
  );

  _i3.Future<void> removeMemberFromSection(_i10.SectionMembership membership) =>
      caller.callServerEndpoint<void>(
        'member',
        'removeMemberFromSection',
        {'membership': membership},
      );

  _i3.Future<_i9.Member> updateMember(_i9.Member member) =>
      caller.callServerEndpoint<_i9.Member>(
        'member',
        'updateMember',
        {'member': member},
      );

  _i3.Future<List<_i9.Member>> getSectionMembers(
    int sectionId, {
    String? filter,
  }) => caller.callServerEndpoint<List<_i9.Member>>(
    'member',
    'getSectionMembers',
    {
      'sectionId': sectionId,
      'filter': filter,
    },
  );
}

/// {@category Endpoint}
class EndpointRegistration extends _i2.EndpointRef {
  EndpointRegistration(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'registration';

  /// Approve or reject a registration
  _i3.Future<_i7.EventRegistration> updateRegistrationStatus(
    int registrationId,
    _i11.RegistrationStatus newStatus, {
    String? notes,
  }) => caller.callServerEndpoint<_i7.EventRegistration>(
    'registration',
    'updateRegistrationStatus',
    {
      'registrationId': registrationId,
      'newStatus': newStatus,
      'notes': notes,
    },
  );

  _i3.Future<_i7.EventRegistration> registerForEvent(
    _i7.EventRegistration registration,
  ) => caller.callServerEndpoint<_i7.EventRegistration>(
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

  _i3.Future<List<_i7.EventRegistration>> getRegistrationsForEvent(
    int eventId,
  ) => caller.callServerEndpoint<List<_i7.EventRegistration>>(
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
  }) : super(
         host,
         _i12.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
       ) {
    emailIdp = EndpointEmailIdp(this);
    refreshJwtTokens = EndpointRefreshJwtTokens(this);
    admin = EndpointAdmin(this);
    event = EndpointEvent(this);
    eventManager = EndpointEventManager(this);
    member = EndpointMember(this);
    registration = EndpointRegistration(this);
    section = EndpointSection(this);
    modules = Modules(this);
  }

  late final EndpointEmailIdp emailIdp;

  late final EndpointRefreshJwtTokens refreshJwtTokens;

  late final EndpointAdmin admin;

  late final EndpointEvent event;

  late final EndpointEventManager eventManager;

  late final EndpointMember member;

  late final EndpointRegistration registration;

  late final EndpointSection section;

  late final Modules modules;

  @override
  Map<String, _i2.EndpointRef> get endpointRefLookup => {
    'emailIdp': emailIdp,
    'refreshJwtTokens': refreshJwtTokens,
    'admin': admin,
    'event': event,
    'eventManager': eventManager,
    'member': member,
    'registration': registration,
    'section': section,
  };

  @override
  Map<String, _i2.ModuleEndpointCaller> get moduleLookup => {
    'serverpod_auth_idp': modules.serverpod_auth_idp,
    'serverpod_auth_core': modules.serverpod_auth_core,
  };
}
