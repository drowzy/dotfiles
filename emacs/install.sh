#!/usr/bin/env bash
bold=$(tput bold)
normal=$(tput sgr0)
EMACS_V="26.3"
URL="http://ftp.gnu.org/gnu/emacs/emacs-$EMACS_V.tar.gz"
INSTALLED_EMACS_VERSION=`emacs --version | head -n1 | grep -oP "([0-9]+\.?)+"`

echo -e "\033[0;34m${bold}[emacs]${normal} \033[0;34mInstalling Emacs ...\033[m"
# Create temporary folder
CDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR=`mktemp -d`

if [ "$INSTALLED_EMACS_VERSION" != "24.5.1" ]; then
    echo -e "\033[0;34m${bold}[emacs]${normal} \033[0;34mSystem installed emacs is not correct version ...\033[m"
    sudo apt-get build-dep emacs24

    echo -e "\033[0;34m${bold}[emacs]${normal} \033[0;34mDownloading Emacs 24.5.1 ...\033[m"
    echo -e "\033[0;34m${bold}[emacs]${normal} \033[0;34mCompiling Emacs 24.5.1\033[m"

    wget -P $DIR $URL
    tar xzf $DIR/$(basename "$URL") -C $DIR
    cd $DIR/emacs-$EMACS_V && ./configure && make -n && sudo make -n install
fi

echo -e "\033[0;34m${bold}[emacs]${normal} \033[0;34mInstalling Spacemacs ...\033[m"
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

echo -e "\033[0;34m${bold}[emacs]${normal} \033[0;34mLinking config, snippets & themes ...\033[m"
ln -sf $CDIR/.spacemacs $HOME/.spacemacs
ln -s $CDIR/snippets/ $HOME/.emacs.d/private/snippets
ln -s $CDIR/themes/ $HOME/.emacs.d/private/themes

# Cleanup temp folder
function cleanup {
    echo -e "\033[0;34m${bold}[fonts]${normal} \033[0;34mInstallation complete\033[m"
    rm -rf "$DIR"
}

trap cleanup EXIT
