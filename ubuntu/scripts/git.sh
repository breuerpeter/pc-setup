#!/bin/bash

echo "Git setup in progress..."

sudo apt install -y --no-install-recommends git

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

tee -a ~/.ssh/config <<EOF
Host github.com
  AddKeysToAgent yes
  IdentityFile ~/.ssh/$SSH_KEY_NAME
EOF

echo "Copy and paste the following public key to GitHub (https://github.com/settings/keys):"
cat ~/.ssh/$SSH_KEY_NAME.pub
sleep 5

GIT_CHECK_SSH="ssh -T git@github.com"
echo "Check the connection using '$GIT_CHECK_SSH'"
sleep 2

# Enable managing repos on Windows file system through WSL
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

echo "Git setup complete."
