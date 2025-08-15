#!/bin/bash

if ! [ -n "$WSL_DISTRO_NAME" ]; then
	echo "Setting up desktop entries for applications..."

	SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
	UBUNTU_DIR="$(dirname "$SCRIPT_DIR")"
	AUTOSTART_DIR="$UBUNTU_DIR/desktop_entries"
	CONFIG_DIR="$UBUNTU_DIR/config"

	# List of applications to create desktop entries for
	APPS=("cursor" "amc" "keymapp")

	mkdir -p ~/.config/desktop_entries

	for app in "${APPS[@]}"; do
		sudo ln -sf "$AUTOSTART_DIR/$app.desktop" /usr/share/applications/
        sudo chmod +x /usr/share/applications/$app.desktop
	done

    echo "Desktop entries created"
fi 