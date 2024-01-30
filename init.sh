#!/bin/bash

# Update and upgrade packages
apt update && apt upgrade -y

# Install necessary packages
apt install -y zsh python3-pip git curl wget zip unzip btop ncdu micro ffmpeg

git config --global core.editor nano
git config --global user.name "Yaroslav Storozhenko"
git config --global user.email yaroslav@storozhenko.dev

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Docker
curl -fsSL https://get.docker.com | sh -s --

# Install Starship
curl -sS https://starship.rs/install.sh | sh
echo 'eval "$(starship init zsh)"' >> ~/.zshrc

# Configure .zshrc for plugins

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

sed -i 's/plugins=(.*)/plugins=(zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

echo 'eval "$(starship init zsh)"' >> ~/.zshrc

# Generate ssh

ssh-keygen -t ed25519

# Clean up a bit

apt autoremove -y

