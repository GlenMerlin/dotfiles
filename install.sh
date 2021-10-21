#!/bin/bash

# Place config and prompt in proper locations
sudo rm /usr/share/zsh/manjaro-zsh-config
sudo rm /usr/share/zsh/manjaro-zsh-prompt
sudo ln -s $PWD/manjaro-zsh-config /usr/share/zsh/manjaro-zsh-config
sudo ln -s $PWD/manjaro-zsh-prompt /usr/share/zsh/manjaro-zsh-prompt

# Place .gitconfig and .zshrc in the home directory
ln -s $PWD/.gitconfig ~/.gitconfig
rm ~/.zshrc
ln -s $PWD/.zshrc ~/.zshrc

# Place pacman.conf in /etc
sudo rm /etc/pacman.conf
sudo ln -s $PWD/pacman.conf /etc/pacman.conf

# Set default mirrorlist for pacman
sudo pacman-mirrors --fasttrack && echo "y" | sudo pacman -Syyu

# Install yay
echo "y" | pacman -S --needed git base-devel yay

# Check for updates
echo "y" | yay

# Set up folder for .AppImages
mkdir ~/Applications

# Move AppImage .desktop files to their proper location
sudo cp $PWD/desktop-files/bitwarden.desktop /usr/share/applications
sudo cp $PWD/desktop-files/standard-notes.desktop /usr/share/applications

# Install Snap
echo "y" | yay -S snapd

# Install Snaps
sudo snap install authy
sudo snap install spotify
sudo snap install termius-app
sudo snap install todoist
sudo snap refresh

# Install Flatpak
echo "y" | yay -S flatpak

# Install Flatpak apps
sudo flatpak install com.mojang.Minecraft
sudo flatpak install com.obsproject.Studio
sudo flatpak install me.okzec.syncthingtk

# Clean out unused packages
yay --clean

# Echo Manual Setup instructions
echo "Download Bitwarden.AppImage and Standard-Notes.AppImage and place them in /home/glenmerlin/Applications"
