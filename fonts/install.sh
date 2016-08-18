#!/usr/bin/env bash
echo "Installing fonts ..."

FONT_AWS_GIT="https://github.com/FortAwesome/Font-Awesome.git"
FONT_PWR_GIT="https://github.com/powerline/fonts.git"
FONT_PWR_DIR="pwr"
FONT_AWS_DIR="aws"
FONT_DIR="$HOME/.local/share/fonts"
# Create fonts dir if it does not exist
mkdir -p $FONT_DIR
# Create temporary folder
DIR=`mktemp -d`

cd $DIR

git clone "$FONT_PWR_GIT" "$FONT_PWR_DIR" && ./$FONT_PWR_DIR/install.sh
git clone "$FONT_AWS_GIT" "$FONT_AWS_DIR" && cp -r ./$FONT_AWS_DIR/fonts/* $FONT_DIR/

# Reset fonts
echo "Resetting font cache.."
fc-cache -f $FONT_DIR

# Cleanup temp folder
function cleanup {
    echo "Font installation complete!"
    rm -rf "$DIR"
}

trap cleanup EXIT
