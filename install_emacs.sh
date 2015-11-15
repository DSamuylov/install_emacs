#!/bin/bash

# This script install and configure emacs 24.5 without sudo (into .local).

NCURSES_VERSION="6.0"
EMACS_VERSION="24.5"
EMACS_PATH=$HOME/apps/emacs

# Prepare build directory
rm -rf build
rm -rf
mkdir build

# Clean .cask directory
rm -rf $HOME/.cask

# Prepare emacs folder
rm -rf $EMACS_PATH
mkdir $EMACS_PATH

cd build # build (in)
Install ncurses
wget http://ftp.gnu.org/pub/gnu/ncurses/ncurses-$NCURSES_VERSION.tar.gz
tar xvf ncurses-$NCURSES_VERSION.tar.gz
cd ncurses-$NCURSES_VERSION
./configure --prefix=$EMACS_PATH --without-install-prefix --with-termlib --enable-termcap --enable-getcap --enable-tcap-names --with-shared
make && make install
cd ..
export LD_LIBRARY_PATH="$EMACS_PATH/lib/:$LD_LIBRARY_PATH"
# Install emacs
wget http://open-source-box.org/emacs/emacs-$EMACS_VERSION.tar.xz
tar xvf emacs-$EMACS_VERSION.tar.xz
cd emacs-$EMACS_VERSION
./configure --prefix=$EMACS_PATH --without-pop --without-kerberos --without-mmdf --without-sound --without-wide-int --without-xpm --without-jpeg --without-tiff --without-gif --without-png --without-rsvg --without-xml2 --without-imagemagick --without-xft --without-libotf --without-m17n-flt --without-xaw3d --without-xim --without-ns --without-gpm --without-dbus --without-gconf --without-gsettings --without-selinux --without-gnutls --without-x
make && make install
cd ..
export EMACS="$EMACS_PATH/bin/emacs-$EMACS_VERSION"
# Install cask (https://github.com/cask/cask)
git clone https://github.com/cask/cask.git
python cask/go
export PATH="$HOME/.cask/bin:$PATH"
cd .. # build (out)

# Copy init files
cp -r emacs.d/* $HOME/.emacs.d

# Initialize cask:
cd $HOME/.emacs.d
cask init

echo "\n"
echo "\n"
echo "\n"
echo "Add into your .bash* file"
echo "export EMACS=\"$EMACS_PATH/bin/emacs-$EMACS_VERSION\""
echo "alias emacs=\"EMACS\""
echo "export PATH=\"$HOME/.cask/bin:\$PATH\""
