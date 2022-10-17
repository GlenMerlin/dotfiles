#!/bin/sh

cd ../configs
# Place config and prompt in proper locations
echo "==> Placing zsh configs in proper locations"
sudo rm /usr/share/zsh/manjaro-zsh-config
sudo rm /usr/share/zsh/manjaro-zsh-prompt
cd zsh
sudo ln -s $PWD/manjaro-zsh-config /usr/share/zsh/manjaro-zsh-config
sudo ln -s $PWD/manjaro-zsh-prompt /usr/share/zsh/manjaro-zsh-prompt
sudo on -s $PWD/zsh-maia-prompt /usr/share/zsh/zsh-maia-prompt

# Place .gitconfig and .zshrc in the home directory

echo "==> Placing gitconfig and zshrc in the home directory"
rm ~/.zshrc
ln -s $PWD/.zshrc ~/.zshrc
cd ../git
ln -s $PWD/.gitconfig ~/.gitconfig

# Set default mirrorlist for pacman
echo "==> Updating mirror list for updates and installations"
sudo pacman-mirrors --fasttrack

# Install paru
echo "==> Installing paru"
cd ../..
sudo pacman -S --needed base-devel --noconfirm
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ../scripts
/bin/sh fix-paru.sh

# Install all my packages
echo "==> Starting package install (This may take a while)"
cd ../
paru -S - < pkgs --noconfirm

# Place pacman.conf in /etc
echo "==> Placing pacman.conf in the proper location"
sudo rm /etc/pacman.conf
cd ../pacman
sudo ln -s $PWD/pacman.conf /etc/pacman.conf
sudo cp update-pkg-list.hook /usr/share/libalpm/hooks/update-pkg-list.hook

# Install Flatpaks
echo "==> Installing Flatpaks"
flatpak install -y --noninteractive flathub com.mojang.Minecraft
flatpak install -y --noninteractive flathub com.obsproject.Studio
flatpak install -y --noninteractive flathub me.okzec.syncthingtk
flatpak install -y --noninteractive flathub im.riot.Riot
flatpak install -y --noninteractive flathub com.anydesk.Anydesk
flatpak install -y --noninteractive flathub com.discordapp.Discord
flatpak install -y --noninteractive flathub com.github.tchx84.Flatseal
flatpak install -y --noninteractive flathub org.standardnotes.standardnotes
flatpak install -y --noninteractive flathub com.bitwarden.desktop
flatpak install -y --noninteractive flathub net.cozic.joplin_desktop

# Clean out unused packages
echo "==> Cleaning up"
paru --clean --noconfirm

# Fix Emoji Issues with Manjaro
echo "==> Fixing Emoji Issues"
paru -S noto-fonts-emoji
cd configs/fonts
sudo ln -s $PWD/local.conf /etc/fonts/local.conf