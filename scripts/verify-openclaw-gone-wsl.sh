#!/usr/bin/env bash
set -e

echo "=== Verify OpenClaw in WSL ==="
if command -v openclaw >/dev/null; then
  echo "OpenClaw STILL present:"
  command -v openclaw
  exit 1
else
  echo "OpenClaw not found in WSL."
fi
