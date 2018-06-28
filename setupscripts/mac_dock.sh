#!/usr/bin/env bash

# Assumes dockutil is installed via homebrew

# Set Dock items
OLDIFS=$IFS
IFS=''

apps=(
    Firefox
    'Sublime Text'
    'Visual Studio Code'
    iTerm
    Postman
    Spotify
    'Sequel Pro'
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