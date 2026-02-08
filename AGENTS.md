# AGENTS.md


This file contains guidelines and commands for agentic coding agents working in this dotfiles repository.

## Repository Overview

This is a personal dotfiles repository for macOS development environments. It uses GNU Stow for managing symlinks and includes configurations for various terminal applications, editors, and development tools.

## Creating Plan

We create todos every time we create a plan.

## Project Structure

```
.
├── install.sh          # Main installation script
├── .opencode/          # OpenCode configuration
├── aerospace/          # AeroSpace window manager config
├── ghostty/            # Ghostty terminal config
├── nvim/               # Neovim configuration (Lua)
├── opencode/           # OpenCode plugins (TypeScript/JavaScript)
└── starship/           # Starship prompt config
```

## Build/Lint/Test Commands

### Shell Scripts
```bash
# Run the installation script
./install.sh

# Validate shell script syntax
bash -n install.sh

# Test individual components by commenting out others in install.sh
```

### Neovim Configuration
```bash
# Test Neovim configuration
nvim --headless -c "lua print('Config loaded successfully')" -c "qa"

# Check for Lua syntax errors
find nvim/ -name "*.lua" -exec luac -p {} \;

# Start Neovim to test configuration
nvim --check-health
```

### OpenCode Plugins (JavaScript/TypeScript)
```bash
# Navigate to plugin directory
cd .opencode/

# Check for syntax errors
node -c plugins/notification.js

# If TypeScript compiler is available:
# npx tsc --noEmit plugins/local-push-notification.ts
```

## Code Style Guidelines

### General Principles
- This is a personal dotfiles repository - prioritize clarity and maintainability
- Keep configurations minimal but functional
- Use consistent indentation (2 spaces for YAML/TOML, 4 spaces for shell scripts)
- Add comments explaining non-obvious configuration choices

### Shell Scripts (install.sh)
- Use `#!/bin/zsh` shebang
- Indent with 4 spaces
- Use descriptive variable names
- Add comments for complex operations
- Use color codes for user-friendly output: `\x1b[1;36m` for cyan, `\x1b[32m` for green, `\x1b[33m` for yellow, `\1b[0m` for reset

### Lua Configuration (Neovim)
- Follow Lua conventions (snake_case for variables, PascalCase for modules)
- Use lazy.nvim for plugin management
- Separate concerns into different files (options.lua, keymaps.lua, etc.)
- Use local variables to avoid global pollution
- Keep configuration files under 100 lines when possible

### TOML/YAML Configuration
- Use 2 spaces for indentation
- Keep sections organized logically
- Add comments for non-default settings
- Use consistent quoting style

### JavaScript/TypeScript (OpenCode Plugins)
- Use ES6+ module syntax (`export const`)
- Use async/await for asynchronous operations
- Follow PascalCase for exported functions/classes
- Use destructuring for function parameters
- Keep plugins small and focused

### File Naming Conventions
- Use lowercase with hyphens for directories (e.g., `starship`)
- Config files should be lowercase with dots (e.g., `alacritty.toml`)
- Lua files use lowercase (e.g., `keymaps.lua`)
- JavaScript/TypeScript use kebab-case for plugins (e.g., `local-push-notification.ts`)

## Import/Dependency Management

### Neovim Plugins
- Use lazy.nvim for plugin management
- Group related plugins in separate files under `lua/plugins/`
- Each plugin file should return a table of plugin specifications

### OpenCode Plugins
- Keep dependencies minimal
- Use async/await pattern for event handlers
- Export functions using ES6 module syntax

## Error Handling

### Shell Scripts
- Check command exit codes: `if [ $? -ne 0 ]; then ... fi`
- Use conditional checks before operations: `if [ ! -d "directory" ]; then ... fi`
- Provide clear error messages with color coding

### Neovim Configuration
- Use pcall() for potentially failing operations
- Check for feature availability before using
- Gracefully handle missing dependencies

### OpenCode Plugins
- Use try/catch blocks for error-prone operations
- Validate input parameters
- Provide fallback behavior when possible

## Specific Tool Configurations

### Terminal Emulators (Ghostty)
- Use consistent opacity and font settings across terminals
- Prefer dark themes with good contrast
- Enable blur effects for visual consistency
- Set appropriate TERM environment variable

### Starship Prompt
- Customize Swift module format with emoji
- Disable package module for cleaner prompt
- Add battery display with threshold
- Maintain compatibility with other shell configurations

### Version Control
- Use descriptive commit messages
- Keep documentation files up to date
- Test configuration changes before committing

## Testing Guidelines

- Test installation script on clean macOS environment
- Verify all symlinks are created correctly after running install.sh
- Check that each application loads its configuration without errors
- Validate syntax of all configuration files
- Test terminal multiplexer configurations (Zellij)

## Development Workflow

1. Make changes to specific tool configuration
2. Test configuration manually by running the tool
3. Run syntax validation scripts if available
4. Test the installation process with `./install.sh`
5. Commit changes with descriptive messages

## Platform Considerations

- This repository is optimized for macOS
- Use conditional checks for macOS-specific features: `if [[ "$OSTYPE" == "darwin"* ]]; then ... fi`
- Leverage Homebrew for package management
- Use macOS-specific paths and permissions

## Security Considerations

- Avoid committing sensitive information (API keys, passwords)
- Use environment variables for configuration when appropriate
- Keep plugin sources reputable and up-to-date
- Review third-party configurations before including

Last updated 2026-02-04
