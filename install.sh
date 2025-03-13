#!/bin/zsh

echo "\x1b[1;36mInstalling Homebrew...\x1b[0m"

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
# install zig
brew install zig
# install terraform
brew install terraform
# install aws
brew install awscli

# macOS only
if [[ "$OSTYPE" == "darwin"* ]]; then
    # AeroSpace: https://github.com/nikitabobko/AeroSpace
    brew install --cask nikitabobko/tap/aerospace

    # JankyBorders: https://github.com/FelixKratz/JankyBorders
    brew tap FelixKratz/formulae
    brew install borders
fi

echo "\x1b[1;36mRestow...\x1b[0m"

stow --restow starship
stow --restow nvim
stow --restow alacritty
stow --restow wezterm
stow --restow ghostty
stow --restow zellij

# macOS only
if [[ "$OSTYPE" == "darwin"* ]]; then
    stow --restow aerospace
fi

echo "\x1b[1;36mClone Alacritty themes...\x1b[0m"

# Alacritty themes
# We use Alacritty's default Linux config directory as our storage location here.
if [ ! -d "alacritty/.config/alacritty/themes" ]; then
    mkdir -p alacritty/.config/alacritty/themes
    git clone https://github.com/alacritty/alacritty-theme alacritty/.config/alacritty/themes
    echo "\x1b[32mSuccess:\x1b[0m Alacritty themes cloned"
else
    echo "\x1b[33mWarning:\x1b[0m Alacritty theme already exists"
fi

