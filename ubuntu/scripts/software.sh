#!/bin/bash

if ! [ -n "$WSL_DISTRO_NAME" ]; then
	echo "Software setup in progress..."

	# snap
	sudo snap install -y vivaldi
	sudo snap install -y --classic code
	sudo snap install -y plotjuggler

	# apt
	sudo apt install -y vim
	sudo apt install -y screen
	sudo apt install -y wireshark

	# pip
	pip install -y rerun-sdk

	echo "Software setup complete"
fi


