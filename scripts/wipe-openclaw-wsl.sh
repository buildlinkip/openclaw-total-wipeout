#!/usr/bin/env bash
set -e

echo "=== OpenClaw WSL wipe ==="
read -p "Wipe OpenClaw from WSL? (y/N): " ANSWER
[[ "$ANSWER" =~ ^[Yy]$ ]] || { echo "Aborted."; exit 0; }

echo "[1/4] Stopping OpenClaw service..."
systemctl --user stop openclaw-gateway.service 2>/dev/null || true
systemctl --user disable openclaw-gateway.service 2>/dev/null || true
rm -f ~/.config/systemd/user/openclaw-gateway.service 2>/dev/null || true
systemctl --user daemon-reload 2>/dev/null || true

echo "[2/4] Removing global npm install..."
npm uninstall -g openclaw 2>/dev/null || true

echo "[3/4] Removing folders..."
rm -rf ~/.openclaw ~/.cache/openclaw /tmp/openclaw ~/openclaw ~/OpenClaw 2>/dev/null || true

echo "[4/4] Checking PATH..."
if command -v openclaw >/dev/null; then
  echo "WARNING: openclaw still found:"
  command -v openclaw
else
  echo "OpenClaw removed from WSL."
fi
