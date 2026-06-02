# List of things to do



## Admin Screen
* Add a way to add / edit sections.
* User search and delete
* consider adding bulk create endpoint for testing


## General



## Registration
- Set roles?
- When registering the section selection screen hangs. Probably the call to getSectionsForCurrentUser() is not working as expected - stale.



notifications: When the user navs to the screen, refresh right away - dont wait for the timer.

Roles - section admins should be able to add trip leaders, participants.

* improve seedtest. Create more realistic data. More trips that are closer to real life. Different sections.


*

issue: when the admin invokes the member-edit screen - the server role check fails beacuse the admin user does not have a profile.


Notifications:  android, etc. Bulk email. Way of allowing users to subscribe to channels (e.g. ski channel, bike channel, etc).

* Need to save to DB, and then use FutureCalls to schedule send.
* DB notification schema could have flags for various types of notification (email, sms, in-app, app-push). You might want to send on multiple channels.
* should have category (for push notification channels)


Bugs:

* Admin - user list does not update if a users profile is edited. Maybe admins should not be able to edit profiles?
* After new login, after completing waiver, the section selection screen hangs.



TODO:

* Data load tool to load templates, sections, users, etc.

sample code
```dart

import 'package:serverpod/serverpod.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import '../generated/protocol.dart'; // Import generated models

class SendEmailsCall extends FutureCall {
  // Methods must return Future<void> and have a Session as the first param
  Future<void> sendNotificationBatch(Session session, EmailBatch batch) async {
    final smtpServer = SmtpServer('localhost', port: 1025); // Mailpit

    // 1. Fetch your hundred users from the DB using the IDs passed in
    final users = await User.db.find(
      session,
      where: (t) => t.id.inSet(batch.recipientIds.toSet()),
    );

    // 2. Process in chunks of 25 to prevent socket/network exhaustion
    const batchSize = 25;
    for (var i = 0; i < users.length; i += batchSize) {
      final chunk = users.sublist(
        i, i + batchSize > users.length ? users.length : i + batchSize
      );

      await Future.wait(chunk.map((user) async {
        final message = Message()
          ..from = Address('events@myapp.com', 'Event Organizer')
          ..recipients.add(user.email)
          ..subject = 'Hey ${user.name}, new event: ${batch.eventTitle}!'
          ..html = '<p>${batch.eventDescription}</p>';

        try {
          await send(message, smtpServer);
        } catch (e) {
          // Serverpod captures print statements directly into its log viewer
          session.log('Failed to send email to ${user.email}: $e', level: LogLevel.error);
        }
      }));

      // Give the event loop a small breather between network bursts
      await Future.delayed(Duration(milliseconds: 50));
    }
  }
}
```
