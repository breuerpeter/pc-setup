#!/bin/bash

if ! [ -n "$WSL_DISTRO_NAME" ]; then
	echo "PlotJuggler setup in progress..."
    
	# Get the download URL for the latest PlotJuggler AppImage
	DOWNLOAD_URL=$(curl -s https://api.github.com/repos/facontidavide/PlotJuggler/releases/latest | \
		grep "browser_download_url.*AppImage" | \
		cut -d '"' -f 4)
	
	if [ -z "$DOWNLOAD_URL" ]; then
		echo "Error: Could not find download URL for PlotJuggler"
		exit 1
	fi
	
	# Download the AppImage
	echo "Downloading PlotJuggler from: $DOWNLOAD_URL"
	wget -O PlotJuggler.AppImage "$DOWNLOAD_URL"
	
	if [ ! -f "PlotJuggler.AppImage" ]; then
		echo "Error: Failed to download PlotJuggler"
		exit 1
	fi
        
	# Create the target directory if it doesn't exist
	sudo mkdir -p /opt/plotjuggler
	
	# Make the AppImage executable and move it to the target location
	sudo chmod +x PlotJuggler.AppImage
	sudo mv PlotJuggler.AppImage /opt/plotjuggler/PlotJuggler.AppImage

    echo "PlotJuggler setup complete"
fi