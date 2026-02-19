---
name: flutter
description: Best practices for Flutter development in the alpine_pod project.
---

# Flutter Development Skill

This skill provides guidelines and best practices for building the Flutter frontend of the alpine_pod application.

## Core Principles

- **Reactive State Management**: Use the `signals` package for all shared and complex UI state. Avoid using `setState` for anything beyond simple, localized toggle states.
- **Widget Decomposition**: Break down complex UI into small, reusable components in the `lib/widgets/` directory.
- **Consistent Styling**: Follow the project's design system. Use `Theme.of(context)` for colors and typography to ensure consistency.
- **Asynchronous Operations**: Handle all server communication asynchronously. Show loading indicators when waiting for data from the Serverpod backend.

## UI Patterns

### Layouts
- Use `Scaffold` for top-level screens.
- Use `Padding`, `Column`, `Row`, and `Stack` for layout construction.
- Ensure the UI is responsive across different screen sizes (especially for member directories and event views).

### Navigation
- Use the established navigation pattern (currently standard Navigator, but be prepared for GoRouter if implemented).
- Pass parameters between screens using constructor arguments for small data, or shared signals for application-wide state.

## Best Practices

- **Code Cleanliness**: Keep build methods lean. Extract complex logic into helper methods or separate widgets.
- **Error Handling**: Use `try-catch` blocks when interacting with Serverpod endpoints and provide user-friendly error messages.
- **Performance**: Minimize unnecessary rebuilds by using `Watch` widgets strategically around only the parts of the UI that depend on signals.
