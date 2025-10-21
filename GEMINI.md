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
* 

## Role Based Access Control (RBAC)

* Admins: Full access to all features and data.
* Section Managers: Can manage Users and Events within their Sections. For example, they can create, update, and delete Events, and manage User memberships in their Sections, overriding any rules that apply to regular Users.
* Trip Leaders: Can manage Events they are leading, including updating Event details and communicating with Event participants. A trip leader can delete an event that they have created.
* Members: Can view and register for Events, and receive Notifications. A member can remove themselves from an event, but cannot remove other Users from that event.
* Guests: Limited access to view public Events and Sections. Guests cannot register for Events or receive Notifications. However, a member can add a guest to an event they are attending. The schema should support this use case.
* Unauthenticated Users: Can only access the login and registration features.
