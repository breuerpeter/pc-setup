#!/bin/bash

# Install Docker Engine (using convenience script)
# https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script

echo "Docker setup in progress..."

curl -fsSL https://get.docker.com -o ./get-docker.sh
sudo sh ./get-docker.sh
rm -rf ./get-docker.sh

# Post-installation steps
# https://docs.docker.com/engine/install/linux-postinstall/

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

echo "Docker setup complete."
