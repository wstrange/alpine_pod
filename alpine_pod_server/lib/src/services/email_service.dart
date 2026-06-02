import 'package:serverpod/serverpod.dart';

class EmailService {
  static final String _apiKey = Serverpod.instance.getPassword('resendApiKey') ?? '';
  static const String _apiEndpoint = 'https://resend.com';
  static const String _fromAddress = 'notifications@yourdomain.com';

  static Future<void> sendHtmlEmail({
    required Session session,
    required String recipientEmail,
    required String subject,
    required String htmlBody,
  }) async {
    if (_apiKey.isEmpty) {
      session.log('Email delivery skipped: "resendApiKey" is missing in passwords.yaml.', level: LogLevel.warning);
      return;
    }

    // todo: fix

    //   try {
    //     final response = await session.serverpod.httpClient.post(
    //       Uri.parse(_apiEndpoint),
    //       headers: {'Authorization': 'Bearer $_apiKey', 'Content-Type': 'application/json'},
    //       body: jsonEncode({
    //         'from': _fromAddress,
    //         'to': [recipientEmail],
    //         'subject': subject,
    //         'html': htmlBody,
    //       }),
    //     );

    //     if (response.statusCode != 200 && response.statusCode != 201) {
    //       session.log(
    //         'Email delivery failed. Status: ${response.statusCode}, Body: ${response.body}',
    //         level: LogLevel.error,
    //       );
    //     }
    //   } catch (e, stackTrace) {
    //     session.log(
    //       'Failed to route email payload over HTTPS.',
    //       level: LogLevel.error,
    //       exception: e,
    //       stackTrace: stackTrace,
    //     );
    //   }
    // }
  }
}
