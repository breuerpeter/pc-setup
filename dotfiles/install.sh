#!/bin/bash

echo "Creating symlinks for dotfiles..."

mkdir -p ~/.config/wezterm/
ln -s ~/dotfiles/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.zshrc ~/.zshrc

# Install tmux plugin manager (TPM) if not installed
if [ ! -d ~/.tmux/plugins/tpm ]; then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	echo "Installed TPM (tmux plugin manager)."
else
	echo "TPM is already installed."
fi

# Start temporary tmux session to trigger plugin installation
tmux new-session -d -s temp

# Give tmux some time to initialize
sleep 1

echo "Installing tmux plugins..."

# Install tmux plugins using TPM
~/.tmux/plugins/tpm/bin/install_plugins

# Kill the temporary tmux session
tmux kill-session -t temp

# Source the tmux config to apply new settings
tmux source-file ~/.tmux.conf

echo "Dotfiles installation complete."
