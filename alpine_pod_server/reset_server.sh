#!/usr/bin/env bash
# reset_server.sh — Full development reset: drop/recreate DB, apply migrations,
#                   and optionally start the server.
#
# Usage:  ./reset_server.sh [--start]
#
# Flags:
#   --start   Start the server after resetting (default: don't start).

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# ---------------------------------------------------------------------------
# 1. Reset the database
# ---------------------------------------------------------------------------
echo "========================================="
echo " Resetting development database"
echo "========================================="
"$SCRIPT_DIR/reset_db.sh"


serverpod generate
serverpod create-migration

# ---------------------------------------------------------------------------
# 2. Apply migrations
# ---------------------------------------------------------------------------
echo ""
echo "========================================="
echo " Applying migrations"
echo "========================================="
dart run bin/main.dart --apply-migrations

echo "Seed data"
"$SCRIPT_DIR/seed.sh"

# Load data

# ---------------------------------------------------------------------------
# 3. Optionally start the server
# ---------------------------------------------------------------------------
if [[ "${1:-}" == "--start" ]]; then
  echo ""
  echo "========================================="
  echo " Starting server"
  echo "========================================="
  dart run bin/main.dart
fi
