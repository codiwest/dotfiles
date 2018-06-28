#!/usr/bin/env bash

# Author: Codi West
# Last Updated: 6/27/18

if test ! $(which brew)
	then
        echo "Installing X Code CLI tools"
        xcode-select --install
		echo "Installing Homebrew..."
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew
brew update
# Upgrade any already-installed formulae
# brew tap homebrew/versions
brew upgrade

apps=(
    bash
    coreutils
    curl
    dockutil
    moreutils
    findutils
    fzf
    gcc
    git
    gnupg
    grep
    nmap
    openssh
    screen
    screenfetch
    tmux
    vim --with-override-system-vi
    wget
    zsh
)
brew install "${apps[@]}"

# Remove outdated versions from the cellar
brew cleanup
