#!/bin/zsh

brew install stow 
# Starship command line prompt
brew install starship
# Neovim install
brew install nvim
# Install ripgrep for grep search in Telescope
brew install ripgrep
# Zellij install
brew install zellij
# GitHub command-line interface
brew install gh
# Install Wezterm
brew install --cask wezterm

stow --restow starship
stow --restow nvim
stow --restow alacritty
stow --restow wezterm
stow --restow zellij

# Alacritty themes
# We use Alacritty's default Linux config directory as our storage location here.
mkdir -p alacritty/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme alacritty/.config/alacritty/themes

