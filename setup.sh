#!/bin/bash

# Init flag to track if there are changes that need a restart
changes=0

echo "Updating package list..."

sudo apt update

# ---------------------------------------------------------------------------- #
#                         Simple package installations                         #
# ---------------------------------------------------------------------------- #

echo "Installing packages..."
sudo apt install -y \
    zsh \
    git \
    tmux \
    python3-pip

# ---------------------------------------------------------------------------- #
#                             Z Shell configuration                            #
# ---------------------------------------------------------------------------- #

# ------------------------ Change default shell to zsh ----------------------- #

sudo chsh -s $(which zsh)
changes=1

# ----------------------------- Install Oh My Zsh ---------------------------- #

# https://github.com/ohmyzsh/ohmyzsh

# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# -------------------------- Set up Starship prompt -------------------------- #

# https://github.com/starship/starship

curl -sS https://starship.rs/install.sh | sh

echo 'eval "$(starship init zsh)"' >> ~/.zshrc

# ---------------------------------------------------------------------------- #
#                               Git configuration                              #
# ---------------------------------------------------------------------------- #

echo "Configuring Git..."

# ---------------------------- Username and email ---------------------------- #

GIT_USERNAME = "Peter Breuer"
GIT_EMAIL = "peter.breuer.profiles@gmail.com"

git config --global user.name $GIT_USERNAME
git config --global user.email $GIT_EMAIL

# --------------------------- Global gitignore file -------------------------- #

touch ~/.gitignore
git config --global core.excludesfile ~/.gitignore

# ------------------------- Setup SSH key for Github ------------------------- #

# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

SSH_KEY_EMAIL = $GIT_EMAIL
SSH_KEY_NAME = "$HOSTNAME-github"

sudo apt install openssh-client
eval $(ssh-agent)
mkdir -p ~/.ssh
cd ~/.ssh

ssh-keygen -t ed25519 -b 4096 -C $SSH_KEY_EMAIL -f $SSH_KEY_NAME
ssh-add ~/.ssh/$SSH_KEY_NAME

tee ~/.ssh/config <<EOF
Host github.com
  AddKeysToAgent yes
  IdentityFile ~/.ssh/$SSH_KEY_NAME
EOF

echo "Copy and paste the following public key to GitHub (https://github.com/settings/keys):"
cat ~/.ssh/$SSH_KEY_NAME

# Check if it works: ssh -T git@bitbucket.org

# --------- Enable managing repos on Windows file system through WSL --------- #

export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

# ---------------------------------------------------------------------------- #
#                                   Miniconda                                  #
# ---------------------------------------------------------------------------- #

# ---------------------------------- Install --------------------------------- #

# https://docs.anaconda.com/miniconda/#miniconda-latest-installer-links

mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh

~/miniconda3/bin/conda init zsh

# ---------------------------------- Config ---------------------------------- #

conda config --set auto_activate_base false

# ---------------------------------------------------------------------------- #
#                                    Docker                                    #
# ---------------------------------------------------------------------------- #

# ------------- Install Docker Engine (using convenience script) ------------- #

# https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script

echo "Installing Docker Engine..."

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh

# -------------------------- Post-installation steps ------------------------- #

# https://docs.docker.com/engine/install/linux-postinstall/

echo "Performing Linux post-installation steps for Docker Engine..."

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# -------------------------- Docker Daemon autostart ------------------------- #

# https://dev.to/felipecrs/simply-run-docker-on-wsl2-3o8

# Enable strict error handling
set -e
set -o pipefail

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


# ---------------------------------------------------------------------------- #
#                                   Optional                                   #
# ---------------------------------------------------------------------------- #

# echo "Installing optional packages..."

# sudo snap install -y \
#     plotjuggler

# sudp apt install -y \
#     x11-xserver-utils \
#     inkscape