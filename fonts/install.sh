#!/usr/bin/env bash
bold=$(tput bold)
normal=$(tput sgr0)
echo -e "\033[0;34m${bold}[fonts]${normal} \033[0;34mInstalling Powerline fonts & Font-Awesome ...\033[m"

FONT_AWS_GIT="https://github.com/FortAwesome/Font-Awesome.git"
FONT_PWR_GIT="https://github.com/powerline/fonts.git"
FONT_PWR_DIR="pwr"
FONT_AWS_DIR="aws"
FONT_DIR="$HOME/.local/share/fonts"
# Create fonts dir if it does not exist
mkdir -p "$FONT_DIR"
# Create temporary folder
DIR=`mktemp -d`

cd "$DIR" || exit

git clone "$FONT_PWR_GIT" "$FONT_PWR_DIR" && ./$FONT_PWR_DIR/install.sh
git clone "$FONT_AWS_GIT" "$FONT_AWS_DIR" && cp -r ./$FONT_AWS_DIR/fonts/* "$FONT_DIR/"

# Reset fonts
echo -e "\033[0;34m${bold}[fonts]${normal} \033[0;34mResetting font cache...\033[m"
fc-cache -f "$FONT_DIR"

# Cleanup temp folder
function cleanup {
    echo -e "\033[0;34m${bold}[fonts]${normal} \033[0;34mInstallation complete\033[m"
    rm -rf "$DIR"
}

trap cleanup EXIT
