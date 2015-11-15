#!/bin/bash

# This script install and configure emacs 24.5 without sudo (into .local).
NCURSES_VERSION="6.0"
EMACS_VERSION="24.5"
EMACS_PATH=".local"

echo "Add into your .bash* file"

# # Install ncurses
# export LD_LIBRARY_PATH="/cluster/home/deniss/.local/lib/:$LD_LIBRARY_PATH"
# echo "LD_LIBRARY_PATH=\"/cluster/home/deniss/.local/lib/:$LD_LIBRARY_PATH\""

# # install emacs
# rm -rf build
# mkdir -p build
# cd build
# # More: https://gist.github.com/tnarihi/6054dfa7b4ad2564819b


# # install emacs

# export EMACS="/cluster/home/deniss/.local/bin/emacs-$EMACS_VERSION"
# # More: https://cask.readthedocs.org/en/latest/guide/installation.html


# # install cask (https://github.com/cask/cask)
# cd ~/.emacs.d
# git clone https://github.com/cask/cask.git
# # TODO
# export PATH="$HOME/.cask/bin:$PATH"

# # initialize cask
# cd ~/.emacs.d
# cask init
# # More: https://cask.github.io/usage.html

# # install pallet (https://github.com/rdallasgray/pallet)
# # Start emacs
# # M-x list-packages
# # Type 'i' on the line listing that package, followed by 'x'.
