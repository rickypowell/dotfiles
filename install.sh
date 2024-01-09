#!/bin/zsh

# Alacritty configuration
ln -s alacritty/.config/alacritty ~/.config/alacritty

# Alacritty themes
# We use Alacritty's default Linux config directory as our storage location here.
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes

# Starship command line prompt
ln -s starship/.config/starship.toml ~/.config/starship.toml 
brew install starship

