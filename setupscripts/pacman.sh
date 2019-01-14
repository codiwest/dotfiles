#!/usr/bin/env bash

apps=(
    code
    firefox
    fzf
    git
    nvidia
    nvidia-settings
    virtualbox
    wget
    yaourt
    zsh
)

sudo pacman -Syu "${apps[@]}"