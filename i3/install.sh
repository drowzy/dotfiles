#!/usr/bin/env bash
bold=$(tput bold)
normal=$(tput sgr0)

echo -e "\033[0;34m${bold}[i3]${normal} \033[0;34mSetting up config...\033[m"

CONFIG_DIR=$HOME/.config/i3
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p $CONFIG_DIR

ln -sf $DIR/config $CONFIG_DIR/config
ln -sf $DIR/i3blocks.conf $CONFIG_DIR/i3blocks.conf

echo -e "\033[0;32m${bold}[i3]${normal} \033[0;32mSetup complete...\033[m"
