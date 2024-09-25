#!/bin/bash

# Enable strict error handling
# set -e
set -o pipefail

WSL_FLAG = ""
WSL=$( [[ " $* " =~ " --wsl " ]] && echo true || echo false )
if [[ "$WSL" = false ]]; then
	WSL_FLAG="--wsl"

if [ $# -eq 0 ]; then
	# Run all scripts if no command-line arguments passed
	echo "Starting setup (all)..."

		for script in ./ubuntu/scripts/*.sh; do
                if [ -f $script ]; then
                        echo "Executing '$script'..."
                        bash "$script $WSL_FLAG" 
                else
                        echo "$script not found!"
                fi
        done

else
	echo "Starting setup ($@)..."

	# Run scripts specified by command-line arguments
	for script in "$@"; do
		SCRIPT="./ubuntu/scripts/$script.sh"
		if [ -f $SCRIPT ]; then
			echo "Executing '$SCRIPT'..."
			bash "$SCRIPT $WSL_FLAG"
		else
			echo "$SCRIPT not found!"
		fi
	done
fi

echo "Setup complete."
