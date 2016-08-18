#!/bin/bash
PKGS="i3 i3blocks git vim zsh"
DOTFILES_REPO="https://github.com/drowzy/dotfiles.git"

echo "Installing packages $PGKS ..."
sudo apt update -y
sudo apt-get install -y $PKGS

echo "Setting up dotfiles ..."
rm -rf ~/.dotfiles/
git clone $DOTFILES_REPO ~/.dotfiles && cd ~/.dotfiles

# Run installation scripts for each directory present in the dotfiles
for dir in */ ; do
    if [ -x $dir/install.sh ]; then
       echo "Running install script for $dir ..."
       $dir/install.sh
    fi
done
