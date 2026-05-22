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


* bug - new login, after completing waiver, the section selection screen hangs. 


issue: when the admin invokes the member-edit screen - the server role check fails beacuse the admin user does not have a profile.

Either a) create a profile for admin, or bypass the check in the server 

maybe the profile create is easiest?



