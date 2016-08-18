#!/usr/bin/env bash
echo "Setting up Xresources & Xmodmap"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -sf $DIR/.Xresources $HOME/.Xresources
ln -sf $DIR/.Xmodmap $HOME/.Xmodmap

xrdb $HOME/.Xresources
