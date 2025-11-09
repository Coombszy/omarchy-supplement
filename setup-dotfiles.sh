#!/bin/sh
set -e

FOLDER=$HOME/.config/dotfiles
BASEDIR=$(pwd)

if [ -d "$FOLDER" ] ; then
  rm -rf "$FOLDER"
fi
git clone https://github.com/coombszy/dotfiles "$FOLDER"

home_stow(){
    stow --adopt -t "$HOME" "$1"
    # Remove any changes found when adopting
    git restore .
}

# Jump and update
cd "$FOLDER"

# Stows!
home_stow git
home_stow omarchy-bash
home_stow alacritty
home_stow nvim

# Return
cd "$BASEDIR"
