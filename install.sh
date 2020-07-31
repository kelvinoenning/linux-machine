#!/bin/sh

if ! [ $(id -u) = 0 ]; then
   echo "ERROR: Please run as root!"
   exit 1
fi

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

apt install apt-transport-https curl -y

printStage "Install >> git"

apt install git -y

printStage "Install >> asdf"

apt-get install dirmngr -y
apt-get install gpg -y

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.8
echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
source ~/.bashrc

printStage "Install >> asdf >> nodejs"

asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install nodejs 14.4.0
asdf global nodejs 14.4.0

printStage "Install >> asdf >> golang"

asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
asdf install golang 1.14.6
asdf global golang 1.14.6

printStage "Install >> nvim"

rm /usr/bin/nvim
curl -O /tmp/nvim.appimage https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
mv /tmp/nvim.appimage /usr/bin/nvim
chmod +x /usr/bin/nvim
mkdir -p /home/${SUDO_USER}/.config/nvim
cp ./config/nvim/init.vim ~/.config/nvim/init.vim
curl -fLo /home/${SUDO_USER}/.config/nvim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

printStage "Install >> Silver Searcher"

apt install silversearcher-ag -y

printStage "Install >> Brave browser"

curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
update
apt install brave-browser -y

printStage "Install >> Zoom"

wget -O /tmp/zoom.deb https://zoom.us/client/latest/zoom_amd64.deb
apt install /tmp/zoom.deb -y
