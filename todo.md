# List of things to dothis.


## Offline Sync is not working well. Create a plan to fix it.
* Client still wants to fetch some data from server when offline. Evetn detailed view, event particpants, managers.
* Notifications get an error when offline.
* Rather than test for wifi, etc. - just test for server being reachable or not.

## Offline expectations

When network is offline:
* All data fetched should be from local cache.
* No attempts to fetch from server.
* Any buttons/apis that would require a network call should be disabled/show an offline state. Any updates should be disabled


## Things to do much later

* Maps package: https://pub.dev/packages/goodmap
* look for redundant endpoint code
* RBAC testing
* Kaisel Router

