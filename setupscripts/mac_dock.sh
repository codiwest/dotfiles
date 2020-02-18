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
    Alacritty
    iTerm
    Anaconda-Navigator
    Postman
    Spotify
    'Sequel Pro'
    Synergy
    'Microsoft OneNote'
    Discord
    Signal
    Slack
    # Arduino
    # TeamViewer
    # texstudio
    Zotero
    RStudio
    CSView
    'Trillium Notes'
    'Microsoft Remote Desktop'
    'App Store'
    'System Preferences'
    'Activity Monitor'
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