#!/bin/bash

WSL=$( [[ " $* " =~ " --wsl " ]] && echo true || echo false )

echo "Software setup in progress..."

if [[ "$WSL" = false ]]; then
	# Browser
	sudo snap install vivaldi
fi

echo "Software setup complete."
