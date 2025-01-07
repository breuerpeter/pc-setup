#!/bin/bash

WSL=$( [[ " $* " =~ " --wsl " ]] && echo true || echo false )

echo "Software setup in progress..."

if [[ "$WSL" = false ]]; then
	sudo snap install vivaldi
	sudo snap install --classic code
	# sudo snap install --classic slack
	sudo apt install vim
	pip install rerun-sdk
fi

echo "Software setup complete."
