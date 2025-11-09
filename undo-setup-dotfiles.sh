#!/bin/sh
set -e

FOLDER=$HOME/.config/dotfiles
BASEDIR=$(pwd)

if [ ! -d "$FOLDER" ] ; then
  echo "stow is not setup"
  exit 0
fi

home_unstow(){
    stow -D -t "$HOME" "$1"
}

# Jump and update
cd "$FOLDER"

# Stows!
home_unstow git
home_unstow omarchy-bash
home_unstow alacritty
home_unstow nvim

# Return
cd "$BASEDIR"

rm -rf "$FOLDER"
