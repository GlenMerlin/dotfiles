#!/bin/bash
cd ../
# Install paru
echo "==> Installing paru"
sudo pacman -S --needed base-devel --noconfirm
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
echo "==> Fixing Paru..."
cd ../configs/pacman
sudo rm /etc/paru.conf
sudo cp $PWD/paru.conf /etc/paru.conf
echo "==> Done!"