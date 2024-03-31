# ubuntu-setup
Shell script to configure a fresh install of Ubuntu or Kubuntu to my preferences. Also contains some dotfiles that can be managed with stow, which was inspired by https://github.com/homeomorfismo/dotfiles

## Instructions
1. Save these files in a folder called `ubuntu-setup` in your home directory `~`.
2. Open a terminal window by pressing `Crtl + Alt + T` and type
```
chmod +x ~/ubuntu-setup/scripts/run.sh && ~/ubuntu-setup/scripts/./run.sh
```

## Update dotfiles with stow
1. To update the dotfiles, navigate to the `ubuntu-setup` directory and run the following command
```
stow . --dotfiles
```
If `stow` encounters a conflict, it will report which files are already present in the home directory. To resolve the conflict, you can rename the conflicting files or, if you are feeling bold, delete them.

## Some of the tools I use
- [stow](https://www.gnu.org/software/stow/) is a command line tool useful for managing dotfiles.
- [LibreWolf](https://librewolf.net/) is a fork of Firefox with sensible defaults.
- [LazyVim](https://www.lazyvim.org/), a collection of configuration files for NeoVim

