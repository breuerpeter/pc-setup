#!/bin/bash

WALLPAPER="/usr/share/backgrounds/canvas_by_roytanck.jpg"

# Only run on native Linux
if ! [ -n "$WSL_DISTRO_NAME" ]; then
	echo "Appearance setup in progress..."

	gsettings set org.gnome.desktop.background picture-uri "file://$WALLPAPER"
	gsettings set org.gnome.desktop.background picture-uri-dark "file://$WALLPAPER"

	# Hide icons from desktop
	gsettings set org.gnome.shell.extensions.desktop-icons show-home false
	gsettings set org.gnome.shell.extensions.desktop-icons show-trash false

	# Dark mode
	gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'

	# Auto-hide dock
	gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
	gsettings set org.gnome.shell.extensions.dash-to-dock autohide true

	echo "Appearance setup complete"
fi
