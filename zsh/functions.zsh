bs () {
  browser-sync start --proxy $1 --files "app/assets/stylesheets/**/*.scss, app/views/**/*.html.slim"
}

mkstylelint() {
  yarn add stylelint-config-sass-guidelines
  echo '{"extends": "stylelint-config-sass-guidelines"}' > .stylelintrc.json
}
ipinfo() {
  curl -s "http://ipinfo.io/$1" | jq .
}

fqdninfo() {
  curl -s https://dns.google.com/resolve?name=$1 | jq .
  ip=$(curl -s https://dns.google.com/resolve?name=$1 | jq -r '.["Answer"][] | select(.type==1) | .["data"]')
  ipinfo $ip
}

fix-dc() {
  docker-compose stop
  docker-compose rm -f
  rm -rf .db
  rm -rf wp-content/debug.log
  touch wp-content/debug.log
  wpe-tool sftp get-db
  mkdir wp-content/uploads
  docker-compose up -d
}

whoport() {
  sudo lsof -iTCP -sTCP:LISTEN -n -P | grep ":$1"
}

phpunit() {
  docker run -v $(pwd):/app --rm phpunit/phpunit $@
}

dobox() {
  # https://github.com/docker/docker.github.io/blob/master/machine/drivers/digital-ocean.md
  docker-machine create --driver digitalocean --digitalocean-size $1 --digitalocean-access-token `pass docker-machine-token@digitalocean` $2
}

sshdo() {
 ssh -i ~/.ssh/personal/id_rsa root@$1 -o=stricthostkeychecking=no
}

rails_tags() {
  ctags -R . $(bundle list --paths)
}

rm_rec() {
    find . -name "$1" -print0 | xargs -0 rm -Rf –
}

railsapp() {
    mkdir $1
    cd $1
    rvm use ruby-2.3.4@$1 --ruby-version --create
    gem install rails
    rails new . -m https://raw.github.com/RailsApps/rails-composer/master/composer.rb
}

password() {
  openssl rand -base64 $1
}

octal() {
    gstat -c "%a %n" $1
}

# db, table
table_to_csv() {
  psql -d $1 -c "COPY (SELECT * from $2) TO STDOUT with CSV HEADER" > $2.csv
}

tu() {
  http GET "http://adapi.dev/accounts/$1?serializer=aproxy"
}

install-nvm() {
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
  nvm install node
  nvm use node
}

# Linux
install-yarn() {
  sudo apt-key adv --fetch-keys http://dl.yarnpkg.com/debian/pubkey.gpg
  echo "deb http://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt update && apt install yarn
}

cimg() {
  docker run -it -v $PWD:/guetzli fabiang/guetzli $@
}
