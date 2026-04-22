#!/bin/sh
set -e

RULES_DIR="/etc/udev/rules.d"
RULES_FILE="$RULES_DIR/99-custom-hidraw.rules"

if [ ! -d "$RULES_DIR" ]; then
    exit 0
fi

if [ -f "$RULES_FILE" ]; then
    sudo rm "$RULES_FILE"
fi

echo 'KERNEL=="hidraw*", ATTRS{idVendor}=="04d8", ATTRS{idProduct}=="eb2d", MODE="0660", GROUP="plugdev"' | sudo tee "$RULES_FILE" > /dev/null

sudo chown $USER:$USER /dev/hidraw4 || true
sudo udevadm control --reload-rules
sudo udevadm trigger
