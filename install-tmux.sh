#!/bin/sh
set -e

sudo pacman -S --noconfirm --needed tmux

FOLDER=$HOME/.tmux/plugins/tpm

if [ ! -d "$FOLDER" ] ; then
    git clone https://github.com/tmux-plugins/tpm "$FOLDER"
fi
