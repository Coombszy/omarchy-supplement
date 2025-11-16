#!/bin/sh

# Lets blow up if any fail!
set -e

# Full system upgrade first
sudo pacman -Syu --noconfirm

. ./install-overrides.sh
. ./install-git.sh
. ./install-stow.sh
. ./install-tmux.sh
. ./install-firefox.sh
. ./install-monitoring.sh

. ./setup-dotfiles.sh
. ./setup-default-theme.sh

. ./uninstall-eza.sh
