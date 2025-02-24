#!/bin/bash

if ! [ -n "$WSL_DISTRO_NAME" ]; then
	echo "Software setup in progress..."

	# snap
	sudo snap install vivaldi
	sudo snap install --classic code
	sudo snap install -y plotjuggler

	# apt
	sudo apt install vim
	sudo apt install screen
	sudo apt install wireshark

	# pip
	pip install rerun-sdk

	echo "Software setup complete."
fi


