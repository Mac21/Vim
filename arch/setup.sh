#!/usr/bin/env bash
# Credit to https://github.com/Airblader for writing most of the setup script.
# I have only made a few modifications.
set -e

echo "Installing network packages"
sudo pacman -S ifplugd

echo "Installing Display Server, WM, and DM"
sudo pacman -S xorg xf86-video-intel xdm-archlinux

echo "Installing prerequisites for pacaur..."
sudo pacman -S base-devel fakeroot jshon expac

echo "Installing dev tools"
sudo pacman -S clang clang-tools-extra neovim tmux cmake gdb ripgrep ninja dcd most

echo "Installing linux kernel requirements"
sudo pacman -S bc xmlto linux-headers libelf kmod mutt esmtp

echo "Installing cower"
mkdir /tmp/tmp-cower
cd /tmp/tmp-cower
curl -L https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=cower -o PKGBUILD
gpg --recv-keys 1EB2638FF56C0C53
makepkg -si
cd -

echo "Installing pacaur..."
mkdir /tmp/tmp-pacaur
cd /tmp/tmp-pacaur
curl -L https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=pacaur -o PKGBUILD
makepkg
sudo pacman --noconfirm -U *.tar.xz
cd -

echo "Installing base packages..."
pacaur --noconfirm --noedit -S \
  termite-git \
  bash-completion

echo "Installing Python dependencies..."
pacaur --noconfirm --noedit -S \
  python-basiciw \
  python-netifaces \
  python-yaml \
  python-pillow \
  python-urllib3 \
  python-virtualenv \
  python2-virtualenv \
  python2-suds \
  python \
  python-pip \
  python2-pip \
  compton-git

echo "Installing window manager dependencies..."
pacaur --noconfirm --noedit -S \
  xcb-util-keysyms \
  xcb-util-wm \
  xcb-util-cursor \
  yajl \
  startup-notification \
  libev

echo "Installing fonts"
pacaur --noconfirm --noedit -S \
  # These fonts are required for development of flash software
  ttf-ms-fonts \
  ttf-dejavu \
  # END
  ttf-font-awesome \
  ttf-material-icons \
  ttf-material-design-icons \
  ttf-hack \
  powerline-fonts-git

echo "Installing tools..."
pacaur --noconfirm --noedit -S \
  i3-gaps \
  i3lock \
  i3blocks-gaps-git \
  i3status-git \
  polybar-git \
  gsimplecal \
  feh \
  acpi \
  xdotool \
  pulseaudio-ctl \
  pavucontrol \
  network-manager-applet \
  networkmanager-openvpn \
  imagemagick \
  dunst \
  ohsnap \
  thunar \
  thunar-archive-plugin \
  file-roller \
  tumbler \
  eog \
  tk \
  aspell-en \
  evince \
  rofi \
  libmtp \
  gvfs-mtp \
  xtitle-git \
  openssh \
  xclip \
  xedgewarp-git \
  unclutter-xfixes-git \
  youtube-dl \
  slop \
  maim \
  neofetch-git \
  htop \
  bluez \
  bluez-utils \
  blueman \
  tmuxinator


echo "Installing some perl stuff..."
pacaur --noconfirm --noedit -S \
  perl-anyevent-i3 \
  perl-json-xs \
