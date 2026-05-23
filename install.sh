#!/usr/bin/env bash

# NetVScan Installation Script
# This script sets up the directories and places the files for the security scanner.

set -euo pipefail

BIN_DIR="$HOME/.local/bin"
SYSTEMD_DIR="$HOME/.config/systemd/user"
STARTUP_DIR="$HOME/.local/bin"
SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
grep -qxF 'export PATH="$HOME/.local/bin:$PATH"' ~/.bashrc || echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc

echo "--- NetVScan Installer ---"

echo "1. Creating directories..."
mkdir -p ~/.local/bin
mkdir -p "$BIN_DIR"
mkdir -p "$SYSTEMD_DIR"
mkdir -p "$STARTUP_DIR"
mkdir -p "$HOME/.local/share" # Directory for logs

echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc

echo "2. Installing scripts to $BIN_DIR..."
cp "$SOURCE_DIR/netvscan" "$BIN_DIR/netvscan"
cp "$SOURCE_DIR/netvscan-run" "$STARTUP_DIR/netvscan-run"
chmod +x "$BIN_DIR/netvscan" "$STARTUP_DIR/netvscan-run"

echo "3. Installing systemd service..."
# Note: This assumes netvscan.service is in the current directory or already at its destination
[[ -f "$SOURCE_DIR/netvscan.service" ]] && cp "$SOURCE_DIR/netvscan.service" "$SYSTEMD_DIR/netvscan.service"

echo "4. Reloading systemd user daemon..."
systemctl --user daemon-reload

echo "Done! You can now enable and start the scanner with:"
echo "systemctl --user enable --now netvscan.service"
