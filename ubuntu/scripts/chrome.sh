#!/bin/bash

if ! [ -n "$WSL_DISTRO_NAME" ]; then
	echo "Chrome setup in progress..."
    
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo dpkg -i google-chrome-stable_current_amd64.deb

    echo "Chrome setup complete"
fi