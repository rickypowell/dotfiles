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
# Install Alacritty
brew install --cask alacritty
# Install Kitty
brew install --cask kitty
# Install Wezterm
brew install --cask wezterm
# install Ghostty
brew install --cask ghostty

stow --restow starship
stow --restow nvim
stow --restow alacritty
stow --restow wezterm
stow --restow ghostty
stow --restow zellij

# Alacritty themes
# We use Alacritty's default Linux config directory as our storage location here.
if [ ! -d "alacritty/.config/alacritty/themes" ]; then
    mkdir -p alacritty/.config/alacritty/themes
    git clone https://github.com/alacritty/alacritty-theme alacritty/.config/alacritty/themes
else
    echo "Theme already exists"
fi

