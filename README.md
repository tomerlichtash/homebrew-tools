# Homebrew Tap for dotsnapshot

A Homebrew tap for dotsnapshot and other CLI tools.

## Installation

```bash
brew tap tomerlichtash/tools
brew install dotsnapshot
```

## Available Formulae

- **dotsnapshot** - A CLI utility to create snapshots of dotfiles and configuration

## Usage

After installation, you can use dotsnapshot:

```bash
# Create a snapshot of all supported tools
dotsnapshot

# List available plugins
dotsnapshot --list

# Get help
dotsnapshot --help

# Generate shell completions
dotsnapshot --completions bash | sudo tee /usr/local/etc/bash_completion.d/dotsnapshot

# Generate man page
dotsnapshot --man | sudo tee /usr/local/share/man/man1/dotsnapshot.1
```

