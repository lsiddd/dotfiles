#!/usr/bin/env bash

function install_fedora {
  deps_fedora

  echo 'copying files'
  cp -ra ./i3/ ~/.config/i3
  cp ./vim/.vimrc ~
  cp -r ./alacritty/ ~/.config/
  cp ./bash/.bashrc ~

  echo 'Installing fonts'
  mkdir ~/.local/share/fonts
  cp ./fonts/*.ttf ~/.local/share/fonts
  fc-cache -fv

  echo  'Installing Scripts'
  cd ~
  git clone https://github.com/vivien/i3blocks-contrib.git ~/.config/i3/i3blocks-contrib
}

function deps_fedora {
  echo "installing standard dependencies"
  sudo dnf install -y git conky rofi zsh dmenu network-manager-applet
  
  echo 'Installing i3-gaps dependencies'
  sudo dnf install -y libxcb-devel xcb-util-keysyms-devel xcb-util-devel \
    xcb-util-wm-devel xcb-util-xrm-devel yajl-devel libXrandr-devel \
    startup-notification-devel libev-devel xcb-util-cursor-devel \
    libXinerama-devel libxkbcommon-devel libxkbcommon-x11-devel \
    pcre-devel pango-devel git gcc automake i3status i3lock
  
  cd ~

  
  git clone https://www.github.com/Airblader/i3 i3-gaps && cd i3-gaps
  
  
  autoreconf --force --install
  rm -rf build/
  mkdir -p build && cd build/
  ../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
  make
  sudo make install
  
  echo 'installing i3blocks'
  sudo dnf -y copr enable wyvie/i3blocks
  sudo dnf -y install i3blocks

  echo 'Installing Alacritty'
  wget https://github.com/jwilm/alacritty/releases/download/v0.2.3/Alacritty-v0.2.3-x86_64.tar.gz
  tar xf Alacritty-v0.2.3-x86_64.tar.gz
  sudo cp alacritty /usr/bin

  echo 'Installing Vim Plugins'
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall

  echo 'Install i3lock-fancy'
  git clone https://github.com/meskarune/i3lock-fancy.git
  cd i3lock-fancy
  sudo make install
  
  echo 'Installing compton'
  dnf copr enable dschubert/compton
  dnf install compton
}

if [[ $(cat /etc/os-release | head -n 1) == 'NAME=Fedora' ]]; 
then
  install_fedora
fi

