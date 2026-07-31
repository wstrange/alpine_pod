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


Need a strategy for offline first in Flutter using serverpod_offline_sync.
Concerned about explosion of data with scope sharing mechanism.
What about a Hybrid approach?  Use serverpod_offline_sync for read only data, and
use the server API for any updates or writes.


Complete the implementation plan for offline first:
* [x] Flutter screens should read from the repo service. (Refactored signals to use repository services)
* [x] Repo should return data from local cache if offline. If online, repo fetches & updates cache.
* [x] Local cache is periodically refreshed in background (`SyncService.initializePeriodicSync()`).



