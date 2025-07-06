#!/usr/bin/env bash

if [ ! -d "$HOME/.config" ]; then
  mkdir -p "$HOME/.config"
fi
if [ ! -d "$HOME/.local/share" ]; then
  mkdir -p "$HOME/.local/share"
fi

# bashrc
echo "source $HOME/.mybashrc" >> $HOME/.bashrc

# stow
stow --target=$HOME */
