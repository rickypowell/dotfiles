# dotfiles

This repository contains my dotfiles. The `install.sh` script will install the dotfiles in the home directory. I am assuming you are on macOS using `brew`, `git`, `zsh`, and `stow`.

The `ghostty/.config/ghostty/shaders` is from https://github.com/linkarzu/dotfiles-latest

## Copilot CLI MCP configuration

This repo includes a stow package for Copilot CLI at `copilot/.copilot/mcp-config.json`.
When stowed, it manages `~/.copilot/mcp-config.json` and enables the `XcodeBuildMCP` server using the Homebrew-installed `xcodebuildmcp` binary from `install.sh`.

Apply with:

```bash
stow --restow copilot
```

Or run `./install.sh` to install tools and restow everything.

Verify in Copilot CLI:

```text
/mcp show
/mcp show XcodeBuildMCP
```

Troubleshooting:

```bash
xcodebuildmcp --help
```

## Legacy

I have removed the following installs because I have not used them in a while. I will keep their configurations just in case I want them back.

- zellij
- alacritty
- kitty
- wezterm
