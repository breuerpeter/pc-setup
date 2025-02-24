#!/bin/bash

# Enable strict error handling
set -o pipefail

echo "Starting setup..."

for script in ./ubuntu/scripts/*.sh; do
	if [ -f $script ]; then
		echo "Executing '$script'..."
		bash "$script"
	else
		echo "$script not found!"
	fi
done

echo "Setup complete."
