#!/bin/bash

if ! [ -n "$WSL_DISTRO_NAME" ]; then
	echo "Setting up autostart applications and window positioning..."

	SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
	UBUNTU_DIR="$(dirname "$SCRIPT_DIR")"
	AUTOSTART_DIR="$UBUNTU_DIR/autostart_ff"
	CONFIG_DIR="$UBUNTU_DIR/config"

	# List of applications to autostart
	APPS=("chrome" "cursor" "gitkraken" "wezterm" "obsidian" "devilspie2")

	mkdir -p ~/.config/autostart
	mkdir -p ~/.config/devilspie2

	echo "Creating symlinks for autostart applications..."
	for app in "${APPS[@]}"; do
		ln -sf "$AUTOSTART_DIR/$app.desktop" ~/.config/autostart/
	done

	echo "Setting up devilspie2 configuration..."
	ln -sf "$CONFIG_DIR/devilspie2/autostart_ff.lua" ~/.config/devilspie2/

	chmod +x ~/.config/autostart/*.desktop
fi 