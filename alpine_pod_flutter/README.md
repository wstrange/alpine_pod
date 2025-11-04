# alpine_pod_flutter

Flutter UI for the alpine_pod Serverpod backend.

## Implementation Notes

* Uses Riverpod, and Flutter Hooks for state management.
* Uses GoRouter for routing.
* Users serverpod_auth_client for authentication.
* Standalone widgets go in lib/widgets/.
* Screens go in lib/screens/
* For now keep the folder nesting to a minimum.


## UI FLow

* The first screen is a login screen. The user is presented with fields for email and password and login button, Google,and Apple buttons, and a register button.
* After login, the user is presented with a list of sections they belong to.They choose the section from the list of sections they belong to, and press continue.  If the user belongs to only one section, they are taken directly to that section's home screen.
* The section home screen has a top app bar with the section name, and a hamburger menu to open the navigation drawer. The main content is a list of upcoming events for that section. There is a botton nav bar with buttons for Home, Events, Profile, and Notifications.

## Routing

Routing is done using GoRouter. If the user has not authencicated they are redirected to the login screen. After login, if the user has not selected a section, they are redirected to the section selection screen. Otherwise, they are taken to the home screen of the selected section.
