#! /bin/bash

# get updates
sudo apt update
sudo apt upgrade -y
sudo snap refresh

# get the current directory
setup_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# import some helper functions
source $setup_dir/utils.sh

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
$setup_dir/./librewolf.sh

# configure `git` and GitHub CLI
sudo apt install -y git gh
gh auth login

# download dotfiles and create symbolic links with `stow`
dotfiles_dir = ~/dotfiles
git clone https://github.com/samreynoldsmath/dotfiles $dotfiles_dir
rm ~/.zshrc
sudo apt install -y stow
stow $dotfiles_dir

# execute distribution-specific commands
distro=$(get_linux_distribution)
if [ "$distro" == "Ubuntu" ]; then
    chmod +x $setup_dir/ubuntu.sh
    $setup_dir/./ubuntu.sh
elif [ "$distro" == "Kubuntu" ]; then
    chmod +x $setup_dir/kubuntu.sh
    $setup_dir/./kubuntu.sh
else
    echo "Distribution not recognized"
fi

# clean up
sudo apt autoremove -y

# reboot the system to apply changes
echo "The system must reboot for all changes to take effect. Reboot now?"
if confirm_prompt; then
    reboot
else
    echo "Reboot the system when you are ready."
fi

