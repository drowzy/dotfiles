#!/usr/bin/env bash
bold=$(tput bold)
normal=$(tput sgr0)

echo -e "\033[0;34m${bold}[X]${normal} \033[0;34mSetting up Xresources & Xmodmap\033[m"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -sf $DIR/.Xresources $HOME/.Xresources
ln -sf $DIR/.Xmodmap $HOME/.Xmodmap

xrdb $HOME/.Xresources

echo -e "\033[0;32m${bold}[X]${normal} \033[0;32mSetup complete!\033[m"
