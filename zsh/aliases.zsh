alias ctop="docker run --rm -ti \
              -v /var/run/docker.sock:/var/run/docker.sock \
              quay.io/vektorlab/ctop:latest"
alias de="docker-compose exec"
alias dea="docker-compose exec app"
alias files="du -ah . | grep -v "/$" | gsort -rh | less"
alias wp="docker-compose exec wordpress wp --allow-root"
alias docker-stats='docker stats --format "table {{.Name}}\t{{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}"'
alias php-errors="find . -type f -name \"*.php\" -exec php -l {} \; | grep -v 'No syntax errors'"
alias json-server="cd ~/work/repos/gitlab.utulsa.co/utilities/json-server && npm run server"
alias bi="gem install bundler; bundle install --jobs=4"
alias refreshdb="wpe-tool sftp get-db && dc stop db && dc rm -f db && dc up -d db"
alias dockergrp="sudo usermod -aG docker $USER"
alias speedtest="docker run --rm --net=host tianon/speedtest"
alias dm="docker-machine"
alias weather="weather -u us -d 7 --hide-icon -l 74063"
alias glances="docker run -v /var/run/docker.sock:/var/run/docker.sock:ro --pid host -it docker.io/nicolargo/glances"
alias clear_cache="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder"
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup'
alias c="clear"
alias dots="cd ~/.dotfiles && vi"
alias ssh_alias="vim ~/.ssh/config"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"
alias whois="whois -h whois.networksolutions.com"
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'
alias greset="git add . && git reset --hard HEAD"
alias lsln="ls -l `find . -maxdepth 1 -type l -print`"
alias e2s="ruby ~/Dropbox/code/scripts/ruby/erbs2slim.rb"
alias do_repl="ruby ~/Dropbox/code/scripts/ruby-scripts/digitalocean_cli_tools/repl.rb"
alias bcp="rsync -avzu --progress"
alias ccat="pygmentize -g"

alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc.local"
alias ohmyzsh="vim ~/.oh-my-zsh"

# Docker
alias dc='docker-compose'
alias install-docker='curl -sSL https://get.docker.com | sudo sh && sudo usermod -aG docker $(whoami)'
alias install-docker-compose="sudo curl -L https://github.com/docker/compose/releases/download/1.5.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"

alias install-vim="brew install macvim --override-system-vim --with-cscope --with-lua --HEAD"
alias gdf="git dsf"

alias ctags="/usr/local/bin/ctags"

# Kyle's

alias be="bundle exec"
alias bu="be unicorn -c config/unicorn.rb"
alias clean="make clean"

alias newpw="LC_ALL=C tr -dc 'A-Za-z0-9' < /dev/urandom | head -c 16 | xargs echo"

OS=`uname | tr "[A-Z]" "[a-z]"`
case $OS in
"darwin")
    alias ls="ls -G"
    alias finder_hide_files="defaults write com.apple.finder AppleShowAllFiles NO;killall Finder"
    alias finder_show_files="defaults write com.apple.finder AppleShowAllFiles YES;killall Finder"
    alias flushdns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder"
    alias ds="du -h -d1 . | gsort -rh | head -n 20"
    ;;
"linux")
    alias ls="ls --color=auto"
    alias auu="sudo apt-get update && sudo apt-get -y upgrade"
    alias ds="du -h -d1 . | sort -rh | head -n 20"
    ;;
"freebsd")
    alias build="sudo poudriere bulk -j 11-amd64"
    alias view="feh -F ."
esac
