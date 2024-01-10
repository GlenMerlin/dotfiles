#!/bin/bash
cd ../
# Place config and prompt in proper locations
echo "==> Placing zsh configs in proper locations"
sudo rm /usr/share/zsh/manjaro-zsh-config
sudo rm /usr/share/zsh/manjaro-zsh-prompt
sudo ln -sv $PWD/configs/zsh/manjaro-zsh-config /usr/share/zsh/manjaro-zsh-config
sudo ln -sv $PWD/configs/zsh/manjaro-zsh-prompt /usr/share/zsh/manjaro-zsh-prompt
sudo ln -sv $PWD/configs/zsh/zsh-maia-prompt /usr/share/zsh/zsh-maia-prompt

# Place .gitconfig and .zshrc in the home directory

echo "==> Placing gitconfig and zshrc in the home directory"
rm ~/.zshrc
ln -sv $PWD/configs/zsh/.zshrc ~/.zshrc
ln -sv $PWD/configs/git/.gitconfig ~/.gitconfig