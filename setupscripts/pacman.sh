#!/usr/bin/env bash

apps=(
    code
    firefox
    fzf
    git
    nvidia
    nvidia-settings
    vim
    virtualbox
    wget
    yaourt
    zsh
)

sudo pacman -Syu "${apps[@]}"