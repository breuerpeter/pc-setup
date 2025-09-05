#!/bin/bash

if ! [ -n "$WSL_DISTRO_NAME" ]; then
	echo "Software setup in progress..."

	# snap
	sudo snap install -y --classic code
	sudo snap install -y plotjuggler
	sudo snap install -y --classic tio

	# apt
	sudo apt install -y vim
	sudo apt install -y screen
	sudo apt install -y wireshark
	sudo apt install -y devilspie2 # window management

	# Chrome
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo dpkg -i google-chrome-stable_current_amd64.deb

	echo "Software setup complete"
fi


