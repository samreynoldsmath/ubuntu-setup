#! /bin/bash

# get updates
sudo apt update
sudo apt upgrade -y
sudo snap refresh

# GNOME: click to minimize
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

# install some dependencies
sudo apt install -y cmake curl lua libfuse2 virtualenv

# install command line tools
sudo apt install -y zsh neovim tmux fzf exa zoxide tree ripgrep bat neofetch

# install OhMyZsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# replace firefox with librewolf
pkill -f firefox
sudo snap remove firefox
chmod +x librewolf.sh
./librewolf.sh

# configure `git` and GitHub CLI
sudo apt install -y git gh
gh auth login

# download dotfiles and create symbolic links with `stow`
dotfiles_dir = ~/dotfiles
git clone https://github.com/samreynoldsmath/dotfiles $dotfiles_dir
rm ~.zshrc
sudo apt install -y stow
stow $dotfiles_dir

# clean up
sudo apt autoremove -y

# reboot the system to apply changes
reboot
