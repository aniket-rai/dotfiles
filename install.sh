#!/bin/bash

echo "-- Starting shell personalisation"

echo "-- Installing Fish"
sudo apt-get update
sudo apt-get install -y fish
sudo chsh -s /usr/bin/fish $USER

echo "-- Installing Starship"
curl -sS https://starship.rs/install.sh > install-starship.sh
chmod +x install-starship.sh
./install-starship.sh --yes

echo "-- Configure config"
mkdir ~/.config
mkdir ~/git
cp starship.toml ~/.config/starship.toml
cp -r fish/ ~/.config/fish/
rm -rf dotfiles/

echo "-- Install build tools"
sudo apt-get install -y build-essential
sudo apt-get install -y golang-go
