#!/bin/bash

echo "-- Starting shell personalisation"

sudo apt-get update
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-get install -y fish
sudo chsh -s /usr/bin/fish $USER

curl -sS https://starship.rs/install.sh | sh

mkdir "~/.config/"
cp starhip.toml ~/.config/starship.toml
cp -r "fish/" "~/.config/"
