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
gstreamer-plugins-bad \
gstreamer-plugins-ugly \
gstreamer1-plugins-ugly \
gstreamer-plugins-good-extras \
gstreamer1-plugins-good \
gstreamer1-plugins-good-extras \
gstreamer1-plugins-bad-freeworld \
ffmpeg \
gstreamer-ffmpeg -y

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

dnf install flatpak -y
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub com.spotify.Client
flatpak install -y flathub org.telegram.desktop
flatpak install flathub com.skype.Client
flatpak install flathub com.visualstudio.code.oss

dnf install gnome-shell-extension-dash-to-dock.noarch -y
dnf install gnome-shell-theme-flat-remix.noarch -y
dnf install numix-icon-theme.noarch -y
dnf install numix-gtk-theme.noarch -y

