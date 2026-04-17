#!/bin/zsh

echo "\x1b[1;36mInstalling Homebrew...\x1b[0m"

brew install stow 
# Starship command line prompt
brew install starship
# Neovim install
brew install nvim
# Install ripgrep for grep search in Telescope
brew install ripgrep
# Install fd for `find` search in Telescope
brew install fd
# GitHub command-line interface
brew install gh
# GitLab command-line interface
brew install glab
# install Ghostty
brew install --cask ghostty
# install terminal fonts used by Ghostty
if ! brew list --cask font-blex-mono-nerd-font &> /dev/null; then
    brew install --cask font-blex-mono-nerd-font
fi

if ! brew list --cask font-dm-mono &> /dev/null; then
    brew install --cask font-dm-mono
fi
# install zig with zvm (skip if already installed)
if ! command -v zvm &> /dev/null; then
    curl https://www.zvm.app/install.sh | bash
fi
# install bun
# refer: https://bun.sh/
brew install oven-sh/bun/bun
# install terraform
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
# install aws
brew install awscli
# install tree
brew install tree
# install Ollama
brew install ollama
# install opencode
brew install anomalyco/tap/opencode
# install xcbeautify
brew install xcbeautify
# xcodebuild MCP
brew tap getsentry/xcodebuildmcp
brew install xcodebuildmcp
# install pnpm
brew install pnpm
# install glow for markdown previews
brew install glow

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
stow --restow ghostty
stow --restow opencode
stow --restow amp

# macOS only
if [[ "$OSTYPE" == "darwin"* ]]; then
    stow --restow aerospace
fi
