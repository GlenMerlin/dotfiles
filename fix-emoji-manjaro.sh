echo "==> Fixing Emoji Issues"
paru -S noto-fonts-emoji
sudo ln -s $PWD/local.conf /etc/fonts/local.conf
echo "==> Done, restart applications to apply the changes"