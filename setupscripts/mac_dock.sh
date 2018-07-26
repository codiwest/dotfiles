#!/usr/bin/env bash

# Assumes dockutil is installed via homebrew

# Set Dock items
OLDIFS=$IFS
IFS=''

apps=(
    ForkLift
    Firefox
    'Sublime Text'
    'Visual Studio Code'
    iTerm
    Anaconda-Navigator
    Postman
    Spotify
    'Sequel Pro'
    Synergy
    'Microsoft OneNote'
    Discord
    Signal
    Arduino
    TeamViewer
    texstudio
    Zotero
    'App Store'
    'System Preferences'
)

dockutil --no-restart --remove all $HOME
for app in "${apps[@]}"
do
    echo "Keeping $app in Dock"
    dockutil --no-restart --add /Applications/$app.app $HOME
done
killall Dock

# restore $IFS
IFS=$OLDIFS