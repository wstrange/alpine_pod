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

Notifications - not refreshing when needed.   Add method to delete notifications???
in app is always enabled. Remove it from the choice.
