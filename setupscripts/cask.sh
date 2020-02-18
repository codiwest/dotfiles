#!/usr/bin/env bash

# Author: Codi West
# Last Updated: 6/27/18

echo “Installing cask...” 
brew tap homebrew/cask

CASKS=(
    alacritty
    alfred
    anaconda
    balenaetcher
    db-browser-for-sqlite
    discord
    docker
    firefox
    forklift
    iterm2
    mactex
    onedrive
    openrefine
    pgadmin4
    postico
    postman
    remote-desktop-connection
    robo-3t
    rstudio
    scroll-reverser
    sensiblesidebuttons
    sequel-pro
    shiftit
    signal
    slack
    spotify
    sublime-text
    #teamviewer
    texstudio
    the-unarchiver
    trillium-notes
    tunnelblick
    ultimaker-cura
    visual-studio-code
    xquartz
    zotero
)

echo “Installing cask apps...”
brew cask install ${CASKS[@]}

