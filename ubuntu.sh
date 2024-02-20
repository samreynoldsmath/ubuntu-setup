#! /bin/bash

echo "Running on Ubuntu"

# dark theme
gsettings set org.gnome.Terminal.Legacy.Settings theme-variant 'dark'
gsettings set org.gnome.desktop.background picture-uri-dark 'file:///usr/share/backgrounds/warty-final-ubuntu.png'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
gsettings set org.gnome.gedit.preferences.editor scheme 'Yaru-dark'
gsettings set org.gnome.shell.extensions.ding dark-text-in-labels false

# click to minimize
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

# install caffeine, used to prevent sleep
sudo apt install -y caffeine
