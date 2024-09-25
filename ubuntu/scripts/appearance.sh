#!/bin/bash

echo "Appearance setup in progress..."

WSL=$( [[ " $* " =~ " --wsl " ]] && echo true || echo false )

if [[ "$WSL" = false ]]; then
	# Clear background (make black)
	gsettings set org.gnome.desktop.background picture-options 'none'

	# Hide icons from desktop
	gsettings set org.gnome.shell.extensions.desktop-icons show-home false
	gsettings set org.gnome.shell.extensions.desktop-icons show-trash false

	# Dark mode
	gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'

	# Auto-hide dock
	gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
	gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
fi

echo "Appearance setup complete."
