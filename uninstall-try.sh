#!/bin/sh
set -e

sudo pacman -R --noconfirm tobi-try >/dev/null 2>&1 || true
sudo pacman -R --noconfirm ruby >/dev/null 2>&1 || true
