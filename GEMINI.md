# Project Instructions for alpine_pod

## Persona

You are an expert Dart and Flutter developer with extensive experience in building full-stack applications using Serverpod and Riverpod. You have a deep understanding of backend server development, client-server communication, and Flutter app development. You are proficient in database management, caching strategies, and asynchronous programming in Dart.
You are also skilled in guiding developers through complex codebases, providing clear explanations, and suggesting best practices for development workflows.


## Project Overview

This is a multi-tenant application to manage users who belong to one more alpine clubs. The application consists of three main components:

* Registration and Membership Management
* Event Scheduling and Management
* Communication and Notifications

## Entity Relationships (informal)

* The term Users is interchangeable with Members. When creating the database schema, use the term Users.
* The application manages Users, Sections, Events, and Notifications.
* Users can belong to multiple Sections.
* Sections can host multiple Events.
* Notifications can be sent to Users based on their Section memberships and Event participation.
* Events can have multiple Trip Leaders assigned to them.

### Events

* Events have attributes such as title, description, date, location, and associated Section. The event should support adding a gps location (latitude and longitude) or a textual location description, such as "Meet at the base of the north face". Alternatively the event can have a http link to a map location.
* The event has a car pooling option, which includes the time and place to meet for car pooling, and if the member is willing to drive or needs a ride.
* Events can span multiple days. They have a start time and end time.
* Events can have a maximum number of participants.
* Events can be marked as public or private. Public events are visible to all Users, while private events are only visible to Users within the associated Section.
* Events can be created, updated, and deleted by authorized Users (e.g., Section Managers, Trip Leaders).
* Users can register for Events and receive Notifications related to those Events.
* Events can have links to standarized docuements, such as waivers, cancellation policy or safety guidelines.
* Events can have a list of required equipment or prerequisites for participation.
* Events can have a waitlist feature when the maximum number of participants is reached.
* Events can have a difficulty rating (e.g., easy, moderate, hard) to help Users choose appropriate activities.
* Events may require users to have specific certifications or skills to participate (e.g., first aid certification, climbing experience).
* The system should track User attendance for Events, allowing Trip Leaders to mark Users as attended or absent.
* Events can have recurring schedules (e.g., weekly, monthly) to facilitate regular activities.
* Events are of a specific type (e.g., hike, climb, ski, social). The event type should be an enumerated value.
* Some events may allow direct registration. Other events have a waitlist, and a trip leader, or section manager, must approve each registration. The schema should support this use case.


### Users

* Users have attributes such as name, email, password (hashed), phone number, and membership status.
* Users can have profile pictures and personal information (e.g., emergency contact details, medical conditions). Emergency contact details are mandatory fields.
* Users have certifications and skills associated with their profiles (e.g., first aid certification, climbing experience, AST 2, etc.). This information can be text.
* Users can belong to multiple Sections.
* Users can have roles such as Admin, Section Manager, Trip Leader, Member, and Guest
* Users can register for Events and receive Notifications.

### Sections

* Sections have attributes such as name, description, location, and contact information.
* Sections can host multiple Events.
* Sections can have multiple Section Managers assigned to them.
* The applicaiton should support creating, updating, and deleting Sections by authorized Users (e.g., Admins).
* Section membersship is managed by an external system. The application should support syncing section membership from an external source via an API. The schema should support storing an external system user ID for each user in each section.

### Notifications

* Notifications have attributes such as title, message, timestamp, and recipient User.
* Notifications can be sent for various purposes, including Event reminders, Section announcements, and system updates.
* Notifications can be marked as read or unread by Users.
* Notifications can be sent via multiple channels, such as email and in-app notifications.
* Users can customize their notification preferences (e.g., frequency, channels).
* Notifications can include attachments or links to relevant resources (e.g., event details, documents).
* Notifications can be grouped or threaded for related messages (e.g., all notifications related to a specific Event).


## Role Based Access Control (RBAC)

* Admins: Full access to all features and data.
* Section Managers: Can manage Users and Events within their Sections. For example, they can create, update, and delete Events, and manage User memberships in their Sections, overriding any rules that apply to regular Users.
* Trip Leaders: Can manage Events they are leading, including updating Event details and communicating with Event participants. A trip leader can delete an event that they have created.
* Members: Can view and register for Events, and receive Notifications. A member can remove themselves from an event, but cannot remove other Users from that event.
* Guests: Limited access to view public Events and Sections. Guests cannot register for Events or receive Notifications. However, a member can add a guest to an event they are attending. The schema should support this use case.
* Unauthenticated Users: Can only access the login and registration features.
* RBAC rules can be expensive to check on every request. Use caching strategies to optimize performance, especially for frequently accessed data.

## Implementation Details

* When generating endpoint methods, prefer to pass in the entity objects (e.g., User, Event) rather than just IDs. If those objects come from the client, ensure they are properly validated on the server side. If a method only needs an id, pass the id, and use a named parameter for clarity.

## Instructions on how to generate the schema, server and client code

To generate the database schema, server code, and client code for the alpine_pod application, follow these steps:

* `cd alpine_pod_server; serverpod generate`. Anytime a .spy.yaml file is changed, this command must be run to regenerate the code.
* Model files (example users.spy.yaml) are located in `alpine_pod_server/lib/src/models/`
* Generated protocol files are located in `alpine_pod_server/lib/src/generated/` and `alpine_pod_flutter/lib/src/generated/`
* After making changes to the models, run the following command to apply migrations to the database:
  * `cd alpine_pod_server; dart bin/main.dart --apply-migrations`
  * Ask me before you apply migrations.
  * This will update the database schema based on the changes made to the models.
  * Make sure the development database is running before applying migrations.
* After applying migrations, restart the Serverpod server to ensure the changes take effect:
  * `dart bin/main.dart`


If you make any changes make sure they are in a new git branch.

