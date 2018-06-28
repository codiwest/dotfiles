#!/bin/bash

OS=`echo $(uname) | tr '[:upper:]' '[:lower:]'`
DOTFILES_DIR="$HOME/.dotfiles"

echo "OS: $OS"
echo "DIR: $DOTFILES"

# DOTFILES="aliases gdbinit gitconfig gitignore i3 polybar rofi screenrc vimrc xinitrc xmodmaprc Xresources Xresources.d zshenv zshrc zsh"
# DOTFILES="git/gitconfig git/gitignore vim/vimrc zshrc zshrc.local zsh/base16-shell"

# Misc functions
install_oh_my_zsh () {
    # Install oh-my-zsh
    if [ ! -d "$HOME/.oh-my-zsh" ]
    then
        echo '  Installing oh-my-zsh'
        # wget --no-check-certificate http://install.ohmyz.sh -O - | sh
        sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    fi
    
    # Add my zsh theme to oh-my-zsh
    if [ ! -L "$HOME/.oh-my-zsh/custom/aussiepure.zsh-theme" ]
    then
        echo '  Installing my zsh prompt theme'
        ln -s $DOTFILES_DIR/zsh/aussiepure.zsh-theme $HOME/.oh-my-zsh/custom/aussiepure.zsh-theme
    fi
    
    # Change login shell to zsh if its not already set
    if [[ ! "$SHELL" == "/usr/local/bin/zsh" ]] && [[ ! "$SHELL" == "/usr/bin/zsh" ]]
    then
        echo '  Switching shell to zsh'
        chsh -s $(which zsh)
    fi
}

install_vundle () {
    # Install Vundle
    if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]
    then
        echo '  Installing Vundle'
        git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    fi
    
    # Install vim plugins
    echo '  Installing vim plugins'
    vim +PluginInstall +qall
}

info () {
    printf "  [ \033[00;34m..\033[0m ] $1"
}

user () {
    printf "\r  [ \033[0;33m?\033[0m ] $1 "
}

success () {
    printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
    printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
    echo ''
    exit
}

link_file () {
    local src=$1 dst=$2
    
    local overwrite= backup= skip=
    local action=
    
    if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
    then
        
        if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
        then
            local currentSrc="$(readlink $dst)"
            if [ "$currentSrc" == "$src" ]
            then
                skip=true;
            else
                user "File already exists: $(basename "$src"), what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
                read -n 1 action
                
                case "$action" in
                    o )
                    overwrite=true;;
                    O )
                    overwrite_all=true;;
                    b )
                    backup=true;;
                    B )
                    backup_all=true;;
                    s )
                    skip=true;;
                    S )
                    skip_all=true;;
                    * )
                    ;;
                esac
            fi
        fi
        
        overwrite=${overwrite:-$overwrite_all}
        backup=${backup:-$backup_all}
        skip=${skip:-$skip_all}
        
        if [ "$overwrite" == "true" ]
        then
            rm -rf "$dst"
            success "removed $dst"
        fi
        
        if [ "$backup" == "true" ]
        then
            mv "$dst" "${dst}.backup"
            success "moved $dst to ${dst}.backup"
        fi
        
        if [ "$skip" == "true" ]
        then
            success "skipped $src"
        fi
    fi
    
    if [ "$skip" != "true" ]  # "false" or empty
    then
        ln -s "$1" "$2"
        success "linked $1 to $2"
    fi
}

install_dotfiles () {
    info 'installing dotfiles'
    local overwrite_all=false backup_all=false skip_all=false
    
    for src in $(find "$DOTFILES_DIR" -maxdepth 2 -name '*.symlink')
    do
        # for src in $DOTFILES; do
        dst="$HOME/.$(basename "${src%.*}")"
        link_file "$src" "$dst"
    done
}

# Run installation scripts based on OS
if [ "$OS" = "darwin" ]; then
    # Ask for the administrator password upfront
    sudo -v
    $DOTFILES_DIR/setupscripts/homebrew.sh
    $DOTFILES_DIR/setupscripts/cask.sh
    $DOTFILES_DIR/setupscripts/macos.sh
    $DOTFILES_DIR/setupscripts/mac_dock.sh
    install_oh_my_zsh
    install_dotfiles
    install_vundle
fi

if [ "$OS" = "linux" ]; then
    if [[ -x $(which apt-get) ]]; then
        # Ask for the administrator password upfront
        sudo -v
        $DOTFILES_DIR/setupscripts/apt.sh
    fi
    
    if [[ -x $(which yum) ]]; then

    fi

    if [[ -x $(which pacman) ]]; then

    fi
fi

echo ''
echo '  All installed!'