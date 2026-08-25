#!/bin/bash
# Installs VTON Realtime on macOS.
#
# Why this is needed: the app is not yet signed with an Apple Developer ID.
# macOS 15 and later look up its ad-hoc signature with Apple, get back a
# "revoked" verdict, and report "contains malware" while moving the app to the
# Trash. Nothing scanned the app and found anything — Gatekeeper simply has no
# publisher to verify. Re-signing locally changes the code hash, which turns
# that hard block into an ordinary unsigned-app rejection.
#
# This is a stopgap. Once the app is signed and notarized it will open normally
# and this script becomes unnecessary.
#
# Usage: open the .dmg, then run:  bash install-macos.sh

set -euo pipefail

SRC=""
for volume in /Volumes/VTON\ Realtime*; do
  [ -d "$volume/VTON Realtime.app" ] && SRC="$volume/VTON Realtime.app"
done

if [ -z "$SRC" ]; then
  echo "No mounted VTON Realtime disk image found."
  echo "Double-click the downloaded .dmg first, then run this again."
  exit 1
fi

APP="/Applications/VTON Realtime.app"

echo "Installing from: $SRC"
pkill -f "VTON Realtime" 2>/dev/null || true
rm -rf "$APP"
cp -R "$SRC" /Applications/

echo "Re-signing locally…"
codesign --force --deep --sign - "$APP"
xattr -dr com.apple.quarantine "$APP"

echo "Verifying…"
spctl -a -vvv "$APP" 2>&1 | head -1 || true

echo "Done. Opening the app."
open "$APP"
