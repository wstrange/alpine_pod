import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart' as core;
import 'package:serverpod_auth_idp_server/providers/email.dart';

class EmailIdpEndpoint extends EmailIdpBaseEndpoint {
  @override
  Future<AuthSuccess> login(
    final Session session, {
    required final String email,
    required final String password,
  }) async {
    var result = await super.login(session, email: email, password: password);
    print('Login result: $result');
    return result;
  }
}

class RefreshJwtTokensEndpoint extends core.RefreshJwtTokensEndpoint {}
