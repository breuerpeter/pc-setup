#!/bin/bash

if ! [ -n "$WSL_DISTRO_NAME" ]; then
	echo "Software setup in progress..."

	# snap
	sudo snap install -y --classic tio
	
	# apt
	sudo apt install -y vim
	sudo apt install -y wireshark
	sudo apt install -y devilspie2 # window management



	echo "Software setup complete"
fi


