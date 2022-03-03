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
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

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
sudo flatpak install com.mojang.Minecraft
sudo flatpak install com.obsproject.Studio
sudo flatpak install me.okzec.syncthingtk
sudo flatpak install im.riot.Riot
sudo flatpak install org.signal.Signal

# Set up folder for .AppImages
echo "==> If you're reading this congrats nothing broke yet"
echo "==> Creating Applications folder for AppImages"
mkdir ~/Applications

# Move AppImage .desktop files to their proper location
echo "==> Moving the desktop files to their proper location"
sudo cp $PWD/desktop-files/bitwarden.desktop /usr/share/applications
sudo cp $PWD/desktop-files/standard-notes.desktop /usr/share/applications

# Install AppImages
echo "==> There is a pretty high likelyhood something breaks here because it's hard coded for specific download links"
echo "==> Might as well continue, Installing standard notes and bitwarden"
wget https://github.com/standardnotes/desktop/releases/download/v3.8.21/standard-notes-3.8.21-linux-x86_64.AppImage
wget https://vault.bitwarden.com/download/?app=desktop&platform=linux
cp 'index.html?app=desktop&platform=linux' ~/Applications/Bitwarden.AppImage
cp 'standard-notes-3.8.21-linux-x86_64.AppImage' ~/Applications/Standard-Notes.AppImage
chmod +x ~/Applications/Bitwarden.AppImage
chmod +x ~/Applications/Standard-Notes.AppImage
wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash
wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash


# Clean out unused packages
echo "==> Cleaning up"
paru --clean --noconfirm

# Fix Emoji Issues with Manjaro
echo "==> Fixing Emoji Issues"
paru -S noto-fonts-emoji
cd configs/fonts
sudo ln -s $PWD/local.conf /etc/fonts/local.conf

# Echo Manual Setup instructions
echo "Don't forget to update standard notes"
