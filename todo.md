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
* social login - multiple redirects, user is assigned as admin? Profile is not created.
* admin login - should not prompt for waiver or proflile
* admin screen should edit users, assign roles, etc.
* signals.dart - needs improvement. some signaals should be streams, eg. when auth state changes. 
