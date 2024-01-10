#!/bin/bash
cd ../
# Place pacman.conf in /etc
echo "==> Placing pacman.conf in the proper location"
sudo rm /etc/pacman.conf
sudo cp $PWD/configs/pacman/pacman.conf /etc/pacman.conf
sudo cp update-pkg-list.hook /usr/share/libalpm/hooks/update-pkg-list.hook