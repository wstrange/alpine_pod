import 'package:serverpod/serverpod.dart';
import 'package:mailer/mailer.dart' as m;
import 'package:mailer/smtp_server.dart';

class EmailService {
  // static final String _apiKey = Serverpod.instance.getPassword('resendApiKey') ?? '';
  // static const String _apiEndpoint = 'https://resend.com';
  // static const String _fromAddress = 'notifications@yourdomain.com';

  // testing using mailpit
  // todo: Use environment variable to configure or get from serverpod config
  static final _smtpServer = SmtpServer('warren.home', port: 1025, allowInsecure: true);

  static Future<void> sendHtmlEmail({
    required Session session,
    required String recipientEmail,
    required String subject,
    required String htmlBody,
  }) async {
    final message = m.Message()
      ..from = m.Address('noreply@acc.ca', 'Alpine Club No Reply')
      ..recipients.add(recipientEmail)
      ..subject = subject
      ..html = htmlBody;

    session.log('Send email to $recipientEmail with subject $subject');
    try {
      final sendReport = await m.send(message, _smtpServer);
      session.log('Message sent: $sendReport');
    } on m.MailerException catch (e) {
      session.log('Email Error: ${e.toString()}');
      rethrow;
    } catch (e) {
      session.log('Email Error: ${e.toString()}');
      rethrow;
    }
  }
}
