#!/bin/bash

if ! [ -n "$WSL_DISTRO_NAME" ]; then
	echo "QGroundControl setup in progress..."
    
	# Get the download URL for the latest QGroundControl AppImage
	DOWNLOAD_URL=$(curl -s https://api.github.com/repos/mavlink/qgroundcontrol/releases/latest | \
		grep "browser_download_url.*AppImage" | \
		cut -d '"' -f 4)
	
	if [ -z "$DOWNLOAD_URL" ]; then
		echo "Error: Could not find download URL for QGroundControl"
		exit 1
	fi
	
	# Download the AppImage
	echo "Downloading QGroundControl from: $DOWNLOAD_URL"
	wget -O QGroundControl.AppImage "$DOWNLOAD_URL"
	
	if [ ! -f "QGroundControl.AppImage" ]; then
		echo "Error: Failed to download QGroundControl"
		exit 1
	fi
        
	# Create the target directory if it doesn't exist
	sudo mkdir -p /opt/qgroundcontrol
	
	# Make the AppImage executable and move it to the target location
	sudo chmod +x QGroundControl.AppImage
	sudo mv QGroundControl.AppImage /opt/qgroundcontrol/QGroundControl.AppImage

    echo "QGroundControl setup complete"
fi
