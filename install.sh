#!/bin/sh

printStage () {
   echo "\n\n====================\n"$1"\n====================\n\n"
}

update() {
   apt update
}

upgrade() {
   apt upgrade -y
}

printStage "Update repositories"

update

printStage "Upgrade"

upgrade

printStage "Install >> curl"

apt install apt-transport-https curl

printStage "Install >> git"

apt install git

printStage "Install >> nvim"

rm /usr/bin/nvim
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
mv nvim.appimage /usr/bin/nvim
chmod +x /usr/bin/nvim
mkdir -p ~/.config/nvim && cp ./config/nvim/init.vim ~/.config/nvim/init.vim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

printStage "Install >> Silver Searcher"

sudo apt-get install silversearcher-ag

printStage "Install >> Brave browser"

curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
update
apt install brave-browser

printStage "Install >> Zoom"

wget -O ~/tmp/zoom.deb https://zoom.us/client/latest/zoom_amd64.deb
apt install ~/tmp/zoom.deb
