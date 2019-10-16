#!/bin/bash

dnf update
hostnamectl status # view current hostname
hostnamectl set-hostname --static "koffee" # set up new hostname

dnf update --refresh
dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

systemctl enable sshd --now

dnf install sysstat htop glances

cd /tmp
wget https://github.com/oguzhaninan/Stacer/releases/download/v1.0.9/Stacer-x86_64.AppImage
chmod a+x stacer*.AppImage
./stacer*.AppImage

dnf install youtube-dl vlc

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
gstreamer-ffmpeg

dnf install menulibre

dnf install copyq -y
dnf install gnome-tweak-tool

rpm --import "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x8320CA65CB2DE8E5"
bash -c 'cat > /etc/yum.repos.d/onlyoffice.repo << 'EOF'
[onlyoffice]
name=onlyoffice repo
baseurl=http://download.onlyoffice.com/repo/centos/main/noarch/
gpgcheck=1
enabled=1
EOF'
dnf install onlyoffice-desktopeditors

dnf install unzip p7zip

dnf install flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.spotify.Client
flatpak install flathub org.telegram.desktop

dnf install gnome-shell-extension-dash-to-dock.noarch
dnf install gnome-shell-theme-flat-remix.noarch
dnf install numix-icon-theme.noarch
dnf install numix-gtk-theme.noarch

