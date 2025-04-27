#!/bin/bash

# Install Docker Engine (using convenience script)
# https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script

echo "Docker setup in progress..."

sudo apt install -y curl
curl -fsSL https://get.docker.com -o ./get-docker.sh
sudo sh ./get-docker.sh
rm -rf ./get-docker.sh

# Post-installation steps
# https://docs.docker.com/engine/install/linux-postinstall/

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# Below is no longer necessary as Docker Desktop is installed on Windows, however keeping here for reference

# if [ -n "$WSL_DISTRO_NAME" ]; then

# 	changes=0

# 	# -------------------------- Docker Daemon autostart ------------------------- #
# 	# https://dev.to/felipecrs/simply-run-docker-on-wsl2-3o8


# 	WSL_CONFIG="/etc/wsl.conf"
# 	SECTION="[boot]"
# 	KEY="systemd"
# 	VALUE="true"

# 	# Check if the section exists
# 	if grep -q "$SECTION" "$WSL_CONFIG"; then
# 	    # Section exists, check if the key-value pair needs updating
# 	    if grep -q "^$SECTION" "$WSL_CONFIG" && grep -q "^$KEY=" "$WSL_CONFIG"; then
# 	        CURRENT_VALUE=$(grep "^$KEY=" "$WSL_CONFIG" | cut -d'=' -f2-)
# 	        if [ "$CURRENT_VALUE" != "$VALUE" ]; then
# 	            # Key exists but with a different value, update the value
# 	            sed -i "s/^$KEY=.*/$KEY=$VALUE/" "$WSL_CONFIG"
#         	    echo "Updated $KEY to $VALUE in $WSL_CONFIG"
# 	            changes=1
#         	else
# 	            echo "$KEY is already set to $VALUE in $WSL_CONFIG"
#         	fi
# 	    else
# 	        # Section exists but the key does not exist, add the key-value pair
#         	sed -i "/^$SECTION/a $KEY=$VALUE" "$WSL_CONFIG"
# 	        echo "Added $KEY=$VALUE under $SECTION in $WSL_CONFIG"
#         	changes=1
# 	    fi
# 	else
# 	    # Section does not exist, add the section and key-value pair
# 	    echo -e "$SECTION\n$KEY=$VALUE" >> "$WSL_CONFIG"
# 	    echo "Added $SECTION and $KEY=$VALUE in $WSL_CONFIG"
# 	    changes=1
# 	fi	

# 	if [ "$changes" -eq 1 ]; then
# 	    echo -e "Restart the WSL instance for changes to take effect:\n \
# 	        wsl --terminate DISTRO_NAME\n \
# 	        wsl -d DISTRO_NAME"
# 	    sleep 5
# 	fi
# fi

echo "Docker setup complete"
