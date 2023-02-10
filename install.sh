#!/bin/bash

echo "-- Starting shell personalisation"

sudo apt-get update
sudo apt-get install -y fish
sudo chsh -s /usr/bin/fish $USER

curl -sS https://starship.rs/install.sh | sh

mkdir ~/.config
cp starship.toml ~/.config/starship.toml
cp -r fish/ ~/.config/fish/
