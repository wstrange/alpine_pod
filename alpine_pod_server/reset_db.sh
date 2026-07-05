#!/usr/bin/env bash
# reset_db.sh — Drop and recreate the Serverpod development database.
#
# Usage:  ./reset_db.sh [database_name]
#
# If no database name is given, defaults to the value in config/development.yaml.
# Reads connection details from config/development.yaml and the password
# from config/passwords.yaml.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DEV_CONFIG="$SCRIPT_DIR/config/development.yaml"
PASSWORDS="$SCRIPT_DIR/config/passwords.yaml"

# ---------------------------------------------------------------------------
# Parse config (simple grep/awk — no YAML library needed for flat values)
# ---------------------------------------------------------------------------
parse_yaml_value() {
  local file="$1" key="$2"
  grep -A0 "^  $key:" "$file" | head -1 | awk '{print $2}' | tr -d "'\""
}

DB_HOST=$(parse_yaml_value "$DEV_CONFIG" "host")
DB_PORT=$(parse_yaml_value "$DEV_CONFIG" "port")
DB_USER=$(parse_yaml_value "$DEV_CONFIG" "user")
DB_NAME="${1:-$(parse_yaml_value "$DEV_CONFIG" "name")}"

# Password lives under the "development:" section in passwords.yaml.
DB_PASS=$(awk '/^development:/{found=1} found && /database:/{print $2; exit}' "$PASSWORDS" | tr -d "'\"")

if [[ -z "$DB_NAME" ]]; then
  echo "ERROR: Could not determine database name." >&2
  exit 1
fi

export PGPASSWORD="$DB_PASS"
PSQL="psql -h $DB_HOST -p $DB_PORT -U $DB_USER"

echo "==> Targeting database: $DB_NAME on $DB_HOST:$DB_PORT as $DB_USER"

# ---------------------------------------------------------------------------
# 1. Terminate active connections
# ---------------------------------------------------------------------------
echo "==> Terminating active connections to '$DB_NAME'..."
$PSQL -d postgres -c "
  SELECT pg_terminate_backend(pid)
  FROM pg_stat_activity
  WHERE datname = '$DB_NAME' AND pid <> pg_backend_pid();
" 2>/dev/null || true

# ---------------------------------------------------------------------------
# 2. Drop the database
# ---------------------------------------------------------------------------
echo "==> Dropping database '$DB_NAME'..."
$PSQL -d postgres -c "DROP DATABASE IF EXISTS \"$DB_NAME\";"

# ---------------------------------------------------------------------------
# 3. Recreate the database
# ---------------------------------------------------------------------------
echo "==> Creating database '$DB_NAME'..."
$PSQL -d postgres -c "CREATE DATABASE \"$DB_NAME\" OWNER \"$DB_USER\";"

echo "==> Database '$DB_NAME' has been reset (empty)."
echo "    Run 'dart run bin/main.dart --apply-migrations' to apply the schema."
