#!/bin/bash

# Enable strict error handling
# set -e
set -o pipefail

SCRIPT_DIR="$HOME/PC-Setup/ubuntu/scripts"

if [ $# -eq 0 ]; then
	# Run all scripts if no command-line arguments passed
	echo "Starting setup (all)..."

		for script in $SCRIPT_DIR/*.sh; do
                if [ -f $script ]; then
                        echo "Executing '$script'..."
                        bash "$script"
                else
                        echo "$script not found!"
                fi
        done

else
	echo "Starting setup ($@)..."

	# Run scripts specified by command-line arguments
	for script in "$@"; do
		SCRIPT="$SCRIPT_DIR/$script.sh"
		if [ -f $SCRIPT ]; then
			echo "Executing '$SCRIPT'..."
			bash "$SCRIPT"
		else
			echo "$SCRIPT not found!"
		fi
	done
fi

echo "Setup complete."
