#!/usr/bin/env bash
echo "Installing fonts ..."

# Create temporary directoyr
DIR=`mktemp -d`
# Clone repo
git clone https://github.com/powerline/fonts.git $DIR
# run install script
$DIR/install.sh

# Cleanup temp folder
function cleanup {
    rm -rf "$DIR"
}

trap cleanup EXIT
