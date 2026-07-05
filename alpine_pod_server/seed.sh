#!/usr/bin/env bash
dart bin/load_data.dart config/data.yaml

dart test test/integration/seed_test.dart

