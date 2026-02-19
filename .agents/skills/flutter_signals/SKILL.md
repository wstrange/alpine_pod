---
name: flutter_signals
description: Guidelines for reactive state management using the signals package.
---

# Flutter Signals Skill

This skill documents the preferred patterns for state management using the `signals` package in the alpine_pod project.

## Signal Types

### 1. Global Signals
Defined in `lib/signals.dart`, these signals represent application-wide state (e.g., current user, active section, global settings).
```dart
final currentUserSignal = signal<User?>(null);
```

### 2. Local Signals
Defined within a `StatefulWidget` or a dedicated controller class for state that is specific to a single screen or component.
```dart
final count = signal(0);
```

### 3. Computed Signals
Used for derived state that automatically updates when its dependencies change.
```dart
final fullName = computed(() => "${firstName.value} ${lastName.value}");
```

## UI Integration

### Using `Watch`
Use the `Watch` widget (or the `.watch(context)` extension) to rebuild specific parts of the UI. Wrap only the smallest necessary widget tree.
```dart
Watch((context) => Text('Count: ${count.value}'))
```

### Using `Effect`
Use `effect` for side effects that should run when a signal changes (e.g., logging, triggering an API call).
```dart
effect(() {
  print("The count is now ${count.value}");
});
```

## Best Practices

- **Naming**: Use descriptive names for signals (e.g., `isLoggedInSignal`, `filteredEventsSignal`).
- **Encapsulation**: Prefer exposing `ReadonlySignal` from controllers to prevent external modification of internal state.
- **Minimal Rebuilds**: Always prefer `Watch` over rebuilding the entire screen for small state changes.
- **Migration**: When refactoring from old `state_beacon` code, replace `.value` access and `.watch()` calls with the equivalent `signals` syntax.
