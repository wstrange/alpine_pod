# AI Agent Instructions for Alpine Pod

## Project Architecture

This is a full-stack Dart/Flutter application built with Serverpod that consists of three main components:

1. **Server (`alpine_pod_server/`)**: A Serverpod backend server
2. **Client SDK (`alpine_pod_client/`)**: Generated Dart client code for server communication
3. **Flutter App (`alpine_pod_flutter/`)**: Flutter frontend application


## Application overvew

Use the file GEMINI.md to understand the application features and data model.

### Key Components

- Server entry point: `alpine_pod_server/lib/server.dart`
- Client connection setup: `alpine_pod_flutter/lib/main.dart`
- Protocol definitions: Generated in `src/generated/protocol.dart`

## Development Workflow

### 1. Starting the Development Environment

```bash
# 1. Start the database and Redis (from alpine_pod_server/)
docker compose up --build --detach

# 2. Start the Serverpod server
dart bin/main.dart

# 3. Run the Flutter app (from alpine_pod_flutter/)
flutter run
```

### 2. Infrastructure Components

- **PostgreSQL**: Runs on port 8090 (dev) / 9090 (test)
  - Uses pgvector extension for vector operations
- **Redis**: Runs on port 8091 (dev) / 9091 (test)
  - Used for caching and real-time features

## Key Patterns

### 1. Future Calls

Server supports background tasks through "Future Calls". Example in `server.dart`:
```dart
pod.registerFutureCall(
  BirthdayReminder(),
  FutureCallNames.birthdayReminder.name,
);
```

### 2. Client Communication

- Use the global `client` object for server communication
- Endpoints are strongly typed and generated from server code
- Example usage in Flutter:
```dart
final result = await client.greeting.hello(name);
```

### 3. Configuration Management

- Environment-specific configs in `alpine_pod_server/config/`
- Server URL configuration in Flutter using `--dart-define=SERVER_URL=<url>`

## Testing

- Separate test infrastructure (Postgres/Redis) runs on different ports
- Integration tests located in `alpine_pod_server/test/integration/`

## Common Gotchas

1. Server URL Configuration:
   - Local development defaults to `http://localhost:8080/`
   - Physical devices need explicit SERVER_URL configuration

2. Generated Code:
   - Don't modify files in `src/generated/` directories
   - Changes should be made to source protocol definitions

## Directory Structure Conventions

- `bin/`: Entry points for executables
- `lib/src/`: Internal library code
- `lib/src/generated/`: Auto-generated protocol code
- `web/`: Static web assets and templates
- `migrations/`: Database migration scripts