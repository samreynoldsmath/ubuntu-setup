#! /bin/bash

echo "Running on Ubuntu"

# GNOME: click to minimize
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

# install caffeine, used to prevent sleep
sudo apt install -y caffeine
