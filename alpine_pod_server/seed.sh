#!/usr/bin/env bash
dart test test/integration/seed_test.dart
dart bin/load_data.dart config/data.yaml

