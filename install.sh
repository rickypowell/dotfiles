#!/bin/zsh

ln -s alacritty/.config/alacritty ~/.config/alacritty
ln -s starship/.config/starship.toml ~/.config/starship.toml 

# Alacritty themes
# We use Alacritty's default Linux config directory as our storage location here.
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes

