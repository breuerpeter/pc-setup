#!/bin/bash

WSL=$( [[ " $* " =~ " --wsl " ]] && echo true || echo false )

echo "Terminal setup in progress..."

echo "Installing terminal packages..."

sudo apt update && sudo apt install -y --no-install-recommends \
	zsh \
	tmux

if [[ "$WSL" = false ]]; then
	# Install wezterm
	# See https://wezfurlong.org/wezterm/install/linux.html
        curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
        echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
        sudo apt update && sudo apt install -y --no-install-recommends wezterm
fi

echo "Creating symlinks for dotfiles..."

if [[ "$WSL" = true ]]; then
	REPO_DIR=/mnt/c/Users/peter/.config
else
	REPO_DIR=$HOME/Code/Personal/PC-Setup
	mkdir -p ~/.config/wezterm
	ln -s $REPO_DIR/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua
fi

ln -s $REPO_DIR/tmux/.tmux.conf ~/.tmux.conf
ln -s $REPO_DIR/zsh/.zshrc ~/.zshrc

echo "Configuring Z Shell..."

# Change default shell to zsh
chsh -s $(which zsh)

# Install Starship prompt
# See https://github.com/starship/starship
curl -sS https://starship.rs/install.sh | sh

echo "Installing tmux plugin manager (TPM)..."

if [ ! -d $HOME/.tmux/plugins/tpm ]; then
        git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
        echo "Installed TPM."
else
        echo "TPM is already installed."
fi

echo "Installing tmux plugins..."

tmux new-session -d -s temp
sleep 1
$HOME/.tmux/plugins/tpm/bin/install_plugins
tmux kill-session -t temp
tmux source-file $HOME/.tmux.conf

# Set default terminal emulator to Wezterm
sudo update-alternatives --set x-terminal-emulator /usr/bin/open-wezterm-here

echo "Terminal setup complete. Log out for changes to take effect."
sleep 5
