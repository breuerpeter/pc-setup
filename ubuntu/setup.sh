#!/bin/bash

# Enable strict error handling
# set -e
set -o pipefail

# ---------------------------------------------------------------------------- #
#                         Simple package installations                         #
# ---------------------------------------------------------------------------- #

echo "Simple package installations in progress..."

sudo apt update
sudo apt install -y --no-install-recommends \
    git \
    zsh \
    tmux \
    python3-pip


echo "Installing dotfiles..."

git clone https://github.com/breuerpeter/dotfiles.git ~/dotfiles
# git clone https://github.com/breuerpeter/dotfiles.git /mnt/c/Users/peter/.config

chmod +x ~/dotfiles/install.sh
~/dotfiles/install.sh

echo "Installing software..."

sudo snap install vivaldi

# ---------------------------------------------------------------------------- #
#                             Z Shell configuration                            #
# ---------------------------------------------------------------------------- #

echo "Z Shell configuration in progress..."

# Change default shell to zsh
sudo chsh -s $(which zsh)

# Install Oh My Zsh (https://github.com/ohmyzsh/ohmyzsh)
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set up Starship prompt (https://github.com/starship/starship)
curl -sS https://starship.rs/install.sh | sh

# ---------------------------------------------------------------------------- #
#                               Git configuration                              #
# ---------------------------------------------------------------------------- #

echo "Git configuration in progress..."

GIT_USERNAME="Peter Breuer"
GIT_EMAIL="peter.breuer.profiles@gmail.com"

git config --global user.name $GIT_USERNAME
git config --global user.email $GIT_EMAIL

# Global gitignore file
touch ~/.gitignore
git config --global core.excludesfile ~/.gitignore

# SSH key for Github
# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

SSH_KEY_EMAIL=$GIT_EMAIL
SSH_KEY_NAME="$HOSTNAME-github"

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
cat ~/.ssh/$SSH_KEY_NAME.pub

GIT_CHECK_SSH="ssh -T git@github.com"
echo "Check the connection using '$GIT_CHECK_SSH'"

# Enable managing repos on Windows file system through WSL
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

# ---------------------------------------------------------------------------- #
#                              Docker Engine setup                             #
# ---------------------------------------------------------------------------- #

# Install Docker Engine (using convenience script)
# https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script

echo "Docker Engine setup in progress..."

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh

# Post-installation steps
# https://docs.docker.com/engine/install/linux-postinstall/

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# ---------------------------------------------------------------------------- #

echo "Log out for shell config to take effect..."
