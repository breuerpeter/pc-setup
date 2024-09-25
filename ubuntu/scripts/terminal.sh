i!#/bin/bash

echo "Terminal setup in progress..."

echo "Installing terminal packages..."

sudo apt update && sudo apt install -y --no-install-recommends \
	zsh \
	tmux

if ! echo "$@" | grep -q "--wsl"; then

        # Wezterm APT repo
        curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
        echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list

        sudo apt update && sudo apt install -y --no-install-recommends wezterm


echo "Installing dotfiles..."

git clone https://github.com/breuerpeter/dotfiles.git ~/dotfiles
# git clone https://github.com/breuerpeter/dotfiles.git /mnt/c/Users/peter/.config

chmod +x ~/dotfiles/install.sh
~/dotfiles/install.sh

echo "Configuring Z Shell..."

# Change default shell to zsh
sudo chsh -s $(which zsh)

# Install Oh My Zsh (https://github.com/ohmyzsh/ohmyzsh)
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set up Starship prompt (https://github.com/starship/starship)
curl -sS https://starship.rs/install.sh | sh

echo "Terminal setup complete."

echo "Log out for changes to take effect."
sleep 5
