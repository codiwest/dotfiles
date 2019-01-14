#!/usr/bin/env bash

# Author: Codi West
# Last Updated: 6/27/18

echo “Installing cask...” 
brew tap homebrew/cask

CASKS=(
    anaconda
    db-browser-for-sqlite
    docker
    double-commander
    firefox
    iterm2
    onedrive
    postico
    postman
    scroll-reverser
    sequel-pro
    shiftit
    signal
    spotify
    sublime-text
    teamviewer
    texstudio
    tunnelblick
    visual-studio-code
)

echo “Installing cask apps...”
brew cask install ${CASKS[@]}

