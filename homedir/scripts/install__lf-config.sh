#!/usr/bin/env bash

SCRIPT_PATH="$(readlink -f "$0")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
cd $SCRIPT_DIR
cd ..
INSTALL_PATH=$(pwd)

echo "install script: lf & lf-config"
# https://codeberg.org/tplasdio/lf-config
# pinned-commit: 6104f8063b8d6c9f7cc15a5e0e459e67754713e7

# sudo apt install lf
(command -v apt > /dev/null 2>&1) && (sudo apt install lf)
(command -v pacman > /dev/null 2>&1) && (sudo pacman -Syu lf)

git clone https://codeberg.org/tplasdio/lf-config $INSTALL_PATH/lf-config
cd $INSTALL_PATH/lf-config
git checkout 6104f8063b8d6c9f7cc15a5e0e459e67754713e7

# remap lf-config keys
sed -i 's/map l down/map l open/g' "$INSTALL_PATH/lf-config/.config/lf/lfrc"
sed -i 's/map j updir/map j down/g' "$INSTALL_PATH/lf-config/.config/lf/lfrc"
sed -i 's/map ñ open/map n open/g' "$INSTALL_PATH/lf-config/.config/lf/lfrc"
sed -i 's/map Ñ openwith/map N openwith/g' "$INSTALL_PATH/lf-config/.config/lf/lfrc"
sed -i 's/map h read/map h updir/g' "$INSTALL_PATH/lf-config/.config/lf/lfrc"
sed -i 's/map gñ push/map gn push/g' "$INSTALL_PATH/lf-config/.config/lf/lfrc"
sed -i 's/a-ñ/a-n/g' "$INSTALL_PATH/lf-config/.config/lf/lfrc"

# stow
mkdir -p ~/{.config/,.local/bin,media}
cd $INSTALL_PATH/lf-config/
stow --target=$HOME/.config .config
cd $INSTALL_PATH/lf-config/.local/
stow --target=$HOME/.local/bin bin
cd $INSTALL_PATH/lf-config/
stow --target=$HOME/media media



