apt-get -y update
apt-get -y upgrade

apps=(
    firefox
    fzf
    gcc
    git
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
apt-get install -y "${apps[@]}"