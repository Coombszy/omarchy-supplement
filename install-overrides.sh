#!/bin/sh

set -e

HYPRLAND_CONFIG="$HOME/.config/hypr/hyprland.conf"
REPO=$(git rev-parse --show-toplevel)
OVERRIDES_CONFIG="$REPO/hyprland-overrides.conf"
SOURCE_LINE="source = $OVERRIDES_CONFIG"

if [ ! -f "$HYPRLAND_CONFIG" ]; then
    echo "Hyprland config not found at $HYPRLAND_CONFIG"
    exit 1
fi


if [ ! -f "$OVERRIDES_CONFIG" ]; then
    echo "Hyprland overrides config not found at $OVERRIDES_CONFIG"
    exit 1
fi

if ! grep -Fxq "$SOURCE_LINE" "$HYPRLAND_CONFIG"; then
    echo ""  >> "$HYPRLAND_CONFIG"
    echo "# omarchy-supplement"  >> "$HYPRLAND_CONFIG"
    echo "$SOURCE_LINE"  >> "$HYPRLAND_CONFIG"
fi
