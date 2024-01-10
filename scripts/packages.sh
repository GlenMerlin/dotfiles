#!/bin/bash
cd ../
# Install all my packages
echo "==> Starting package install (This may take a while)"
paru -S - < pkgs

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
