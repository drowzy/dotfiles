#!/bin/bash
PKGS="i3 i3blocks git vim zsh curl"
DOTFILES_REPO="https://github.com/drowzy/dotfiles.git"

bold=$(tput bold)
normal=$(tput sgr0)

echo -e "\033[0;34m${bold}.... BOOTSTRAPING DOTFILES ....${normal}\033[m"

echo -e "\033[0;34m${bold}[bootstrap]${normal} \033[0;34mInstalling packages $PGKS ...\033[m"
sudo apt update -y
sudo apt-get install -y $PKGS

echo -e "\033[0;34m${bold}[bootstrap]${normal} \033[0;34mCloning dotfiles....\033[m"
rm -rf ~/.dotfiles/
git clone $DOTFILES_REPO ~/.dotfiles && cd ~/.dotfiles || exit

# Run installation scripts for each directory present in the dotfiles
for dir in */ ; do
    if [ -x "$dir/install.sh" ]; then
        echo -e "\033[0;34m${bold}[bootstrap]${normal} \033[0;34mRunning install script for $dir ...\033[m"
       "$dir/install.sh"
    fi
done

echo -e "\033[0;32m${bold}.... BOOTSTRAPING COMPLETED ....${normal}\033[m"
