#!/usr/bin/env bash
set -e

echo "Searching for the OpenClaw wipeout repo..."

REPO=$(find /mnt/c -maxdepth 6 -type d -name 'openclaw-total-wipeout*' 2>/dev/null | head -n 1)

if [ -z "$REPO" ]; then
  echo "Could not find the repo. Make sure you unzipped it somewhere on your C: drive."
  exit 1
fi

echo "Found repo at:"
echo "$REPO"
echo
echo "To enter the scripts folder, run:"
echo "cd \"$REPO/scripts\""
