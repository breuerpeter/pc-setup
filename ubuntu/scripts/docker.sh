#!/bin/bash

set -euo pipefail

# Install Docker Desktop
# https://docs.docker.com/desktop/setup/install/linux/ubuntu/

# Download the latest Docker Desktop .deb
curl -L "https://desktop.docker.com/linux/main/amd64/docker-desktop-amd64.deb" -o docker-desktop-amd64.deb

# Install the package
sudo apt-get update
sudo apt-get install -y ./docker-desktop-amd64.deb

# Clean up the .deb
rm docker-desktop-amd64.deb

# Post-installation steps
# https://docs.docker.com/engine/install/linux-postinstall/

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# Automatically start on login
systemctl --user enable docker-desktop

# TODO: might require Docker MCP CLI (https://github.com/docker/mcp-gateway)

docker mcp catalog init
docker mcp server enable context7
docker mcp server enable github-official
docker mcp server enable obsidian
docker enable youtube-transcript

echo "Open Docker Desktop and enter secrets"
sleep 2

echo "Docker setup complete"