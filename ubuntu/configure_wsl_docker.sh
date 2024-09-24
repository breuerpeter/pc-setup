#!/bin/bash

# Enable strict error handling
set -e
set -o pipefail

# Init flag to track if there are changes that need a restart
changes=0

# -------------------------- Docker Daemon autostart ------------------------- #
# https://dev.to/felipecrs/simply-run-docker-on-wsl2-3o8


WSL_CONFIG="/etc/wsl.conf"
SECTION="[boot]"
KEY="systemd"
VALUE="true"

# Check if the section exists
if grep -q "$SECTION" "$WSL_CONFIG"; then
    # Section exists, check if the key-value pair needs updating
    if grep -q "^$SECTION" "$WSL_CONFIG" && grep -q "^$KEY=" "$WSL_CONFIG"; then
        CURRENT_VALUE=$(grep "^$KEY=" "$WSL_CONFIG" | cut -d'=' -f2-)
        if [ "$CURRENT_VALUE" != "$VALUE" ]; then
            # Key exists but with a different value, update the value
            sed -i "s/^$KEY=.*/$KEY=$VALUE/" "$WSL_CONFIG"
            echo "Updated $KEY to $VALUE in $WSL_CONFIG"
            changes=1
        else
            echo "$KEY is already set to $VALUE in $WSL_CONFIG"
        fi
    else
        # Section exists but the key does not exist, add the key-value pair
        sed -i "/^$SECTION/a $KEY=$VALUE" "$WSL_CONFIG"
        echo "Added $KEY=$VALUE under $SECTION in $WSL_CONFIG"
        changes=1
    fi
else
    # Section does not exist, add the section and key-value pair
    echo -e "$SECTION\n$KEY=$VALUE" >> "$WSL_CONFIG"
    echo "Added $SECTION and $KEY=$VALUE in $WSL_CONFIG"
    changes=1
fi

if [ "$changes" -eq 1 ]; then
    echo -e "Restart the WSL instance for changes to take effect:\n \
        wsl --terminate DISTRO_NAME\n \
        wsl -d DISTRO_NAME"
fi