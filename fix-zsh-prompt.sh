#!/bin/sh

echo "==> This script requires root privledges to run. Make sure to run it as root. The script may prompt you to enter your password."

echo "==> Placing zsh configs in proper locations"
sudo rm /usr/share/zsh/manjaro-zsh-config
sudo rm /usr/share/zsh/manjaro-zsh-prompt
sudo ln -s $PWD/manjaro-zsh-config /usr/share/zsh/manjaro-zsh-config
sudo ln -s $PWD/manjaro-zsh-prompt /usr/share/zsh/manjaro-zsh-prompt

echo "==> Overwriting .zshrc"
rm ~/.zshrc
ln -s $PWD/.zshrc ~/.zshrc

echo "==> Done!"