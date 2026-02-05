#!/usr/bin/env bash

echo "install script: lf & lf-config"
# https://codeberg.org/tplasdio/lf-config
# pinned-commit: 6104f8063b8d6c9f7cc15a5e0e459e67754713e7

sudo apt install lf
(command -v apt > /dev/nul 2>&1) && (sudo apt install lf)
(command -v pacman > /dev/nul 2>&1) && (sudo pacman -Syu lf)

mkdir -p ~/.config
git clone https://codeberg.org/tplasdio/lf-config ~/.config/lf-config
cd ~/.config/lf-config
git checkout 6104f8063b8d6c9f7cc15a5e0e459e67754713e7

# remap lf-config keys
sed -i 's/map l down/map l open/g' ~/.config/lf-config/.config/lf/lfrc
sed -i 's/map j updir/map j down/g' ~/.config/lf-config/.config/lf/lfrc
sed -i 's/map ñ open/map n open/g' ~/.config/lf-config/.config/lf/lfrc
sed -i 's/map Ñ openwith/map N openwith/g' ~/.config/lf-config/.config/lf/lfrc
sed -i 's/map h read/map h updir/g' ~/.config/lf-config/.config/lf/lfrc
sed -i 's/map gñ push/map gn push/g' ~/.config/lf-config/.config/lf/lfrc
sed -i 's/a-ñ/a-n/g' ~/.config/lf-config/.config/lf/lfrc


