#!/bin/zsh

# Alacritty configuration
ln -s "$PWD/alacritty/.config/alacritty" ~/.config/alacritty

# Alacritty themes
# We use Alacritty's default Linux config directory as our storage location here.
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes

# Starship command line prompt
ln -s "$PWD/starship/.config/starship.toml" ~/.config/starship.toml 
brew install starship

# Nvim install
brew install nvim

# Nvim configuration 
# Install ripgrep for grep search in Telescope
brew install ripgrep
ln -s "$PWD/nvim/.config/nvim" ~/.config/nvim
