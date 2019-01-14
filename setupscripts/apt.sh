#!/usr/bin/env bash

apt-get -y update
apt-get -y upgrade

apps=(
    firefox
    fzf
    gcc
    git
    grep
    neofetch
    nmap
    openssh
    screen
    tmux
    vim --with-override-system-vi
    wget
    zsh
)
apt-get install -y "${apps[@]}"