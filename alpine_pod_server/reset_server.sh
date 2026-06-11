#!/bin/bash

# Reset script for alpine_pod server environment

 # we now use embedded postgres

# Stop and remove containers and volumes
# echo "--- Stopping and removing docker containers and volumes ---"
# docker compose down -v


pkill serverpod

# Delete migrations
echo "--- Deleting existing migrations ---"
rm -rf migrations/*

echo "--- Deleting existing database ---"
rm -rf .serverpod/development/*

# Start containers
# echo "--- Starting docker containers ---"
# # docker compose up -d


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


# Load data
dart run bin/load_data.dart config/data.yaml

echo "--- Reset complete ---"
