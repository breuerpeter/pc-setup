#!/bin/bash

if ! [ -n "$WSL_DISTRO_NAME" ]; then
	echo "PlotJuggler setup in progress..."
    
	curl -s https://api.github.com/repos/facontidavide/PlotJuggler/releases/latest \
	 	grep "browser_download_url.*AppImage" \
   		cut -d '"' -f 4 \
  	 	wget -i -
        
	sudo chmod +x PlotJuggler-*.AppImage
	sudo mv PlotJuggler-*.AppImage /opt/plotjuggler/PlotJuggler.AppImage

    echo "PlotJuggler setup complete"
fi