#!/bin/bash

# Kill all processes related to flutter run, daemon, and the tooling daemon
echo "Killing all Flutter-related processes..."

# Kill flutter run and its children (using -f to match full command line)
pkill -f "flutter_tools.snapshot"

# Kill Dart processes that are often started by flutter
# pkill -f "dart tooling-daemon"
# pkill -f "dart devtools"

# # Kill any remaining flutter processes
# pkill -f "flutter"

# Kill Chrome instances started by Flutter (optional, but often helpful)
# pkill -f "Google Chrome"

echo "Done."
