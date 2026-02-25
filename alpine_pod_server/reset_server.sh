#!/bin/bash

# Reset script for alpine_pod server environment

# Stop and remove containers and volumes
echo "--- Stopping and removing docker containers and volumes ---"
docker compose down -v

# Delete migrations
echo "--- Deleting existing migrations ---"
rm -rf migrations/*

# Start containers
echo "--- Starting docker containers ---"
docker compose up -d

# Wait for database to be ready
echo "--- Waiting for database to be ready (10s) ---"
sleep 10

# Generate code
echo "--- Running serverpod generate ---"
serverpod generate

# Create fresh migration
echo "--- Creating fresh migration ---"
serverpod create-migration

# Apply migrations
# echo "--- Applying migrations to database ---"
# dart run bin/main.dart --apply-migrations

# Run seeding test
echo "--- Seeding database with sample data ---"
dart test test/integration/seed_test.dart

echo "--- Reset complete ---"
