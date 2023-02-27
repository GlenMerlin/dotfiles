#!/bin/bash
while getopts 'y' OPTION; do
  case "$OPTION" in
    y)
        /bin/bash terminal-configs.sh
        /bin/bash wallpaper.sh
        /bin/bash paru.sh
        /bin/bash packages.sh
        /bin/bash pacman-configs.sh
        /bin/bash clean.sh
        /bin/bash fix-emoji.sh
        exit 0    
    ;;
  esac
done

read -p "install terminal configs (y/n)? "
if [[ $REPLY =~ ^[Yy]$ ]]
then
    /bin/bash terminal-configs.sh
fi

read -p "install desktop wallpaper (y/n)? "
if [[ $REPLY =~ ^[Yy]$ ]]
then
    /bin/bash wallpaper.sh
fi

read -p "install paru (y/n)? "
if [[ $REPLY =~ ^[Yy]$ ]]
then
    /bin/bash paru.sh
fi

read -p "install packages (y/n)? "
if [[ $REPLY =~ ^[Yy]$ ]]
then
    /bin/bash packages.sh
fi

read -p "install pacman configs (y/n)? "
if [[ $REPLY =~ ^[Yy]$ ]]
then
    /bin/bash pacman-configs.sh
fi

read -p "clean up unused packages (y/n)? "
if [[ $REPLY =~ ^[Yy]$ ]]
then
    /bin/bash clean.sh
fi

read -p "fix emoji font issues (y/n)? "
if [[ $REPLY =~ ^[Yy]$ ]]
then
    /bin/bash fix-emoji.sh
fi

echo "==> All Done!"