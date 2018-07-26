#!/usr/bin/env bash

# Author: Codi West
# Last Updated: 6/27/18

echo “Installing cask...” 
brew tap homebrew/cask

CASKS=(
    anaconda
    arduino
    discord
    docker
    firefox
    forklift
    iterm2
    onedrive
    postico
    postman
    scroll-reverser
    sensiblesidebuttons
    sequel-pro
    shiftit
    signal
    spotify
    sublime-text
    teamviewer
    texstudio
    tunnelblick
    visual-studio-code
    zotero
)

echo “Installing cask apps...”
brew cask install ${CASKS[@]}

