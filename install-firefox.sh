#!/bin/sh
set -e

sudo pacman -S --noconfirm --needed firefox

xdg-settings set default-web-browser firefox.desktop
