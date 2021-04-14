#!/bin/bash

dnf update -y
hostnamectl status # view current hostname
hostnamectl set-hostname --static "koffee" # set up new hostname

dnf update --refresh -y
dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

systemctl enable sshd --now

dnf install sysstat htop glances -y

cd /tmp
wget https://github.com/oguzhaninan/Stacer/releases/download/v1.0.9/Stacer-x86_64.AppImage
chmod a+x stacer*.AppImage
./stacer*.AppImage

dnf install youtube-dl vlc -y

dnf install \
gstreamer-plugins-base \
gstreamer1-plugins-base \
gstreamer-plugins-bad-free \
gstreamer1-plugins-good \
gstreamer1-plugins-bad-freeworld \
ffmpeg -y

dnf install menulibre -y

dnf install vim gcc gcc-c++ python-pip mpv -y

dnf install copyq -y
dnf install gnome-tweak-tool -y

# docker
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io

rpm --import "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x8320CA65CB2DE8E5"
bash -c 'cat > /etc/yum.repos.d/onlyoffice.repo << 'EOF'
[onlyoffice]
name=onlyoffice repo
baseurl=http://download.onlyoffice.com/repo/centos/main/noarch/
gpgcheck=1
enabled=1
EOF'
dnf install onlyoffice-desktopeditors -y

dnf install unzip p7zip -y

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim -y
sudo dnf install cmake gcc-c++ make python3-devel -y
sudo dnf install npm golang -y
sudo dnf install clang-tools-extra -y
sudo dnf install boost-devel -y


sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf check-update
sudo dnf install code brave-browser


dnf install flatpak -y
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub com.spotify.Client
flatpak install -y flathub org.telegram.desktop
flatpak install -y flathub com.skype.Client
flatpak install -y flathub com.elsevier.MendeleyDesktop
