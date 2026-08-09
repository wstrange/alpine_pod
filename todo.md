# List of things to do




Maps package: https://pub.dev/packages/goodmap

Test on Android
Look for redundant endppoint code
RBAC testing
Flutter client should show error if the server is not available
Add image for profile.


Sync notes:
19000 members. Say 1K per member of profile data to sync. Approx 20 MB.
Events - probably want to be selective on which events to cache.


getMemberProfileImageUrl is expensive. Should we return it as part of the member profile? Make it a non DB field, but get it from the user object.  Could also cache it on the client.  Maybe the client should have a member cache.


Working on:
- Integrate getMemberProfileImageUrl into the Member object on server side
- sync service just needs to sync since last update time


why is sync on the client not working



