#!/bin/bash

# Enable strict error handling
set -o pipefail

# Move this repo to the code dir
mkdir -p ~/code && mkdir -p ~/code/personal && cd ~/code/personal
mv "$(pwd)/pc-setup" . && cd pc-setup

# Run setup scripts
sudo chmod +x ./scripts # /mnt/c/Users/peter/.config

echo "Starting setup..."

for script in ./ubuntu/scripts/*.sh; do
	if [ -f $script ]; then
		echo "Executing '$script'..."
		bash "$script"
	else
		echo "$script not found!"
	fi
done

echo "Setup complete"
