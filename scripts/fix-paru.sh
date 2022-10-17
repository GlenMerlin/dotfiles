#! /bin/sh
echo "==> Fixing Paru..."
cd ../configs/pacman
sudo rm /etc/paru.conf
sudo ln -s $PWD/paru.conf /etc/paru.conf
echo "==> Done!"