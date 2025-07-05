#!/usr/bin/env bash

if [ ! -d "$HOME/.config" ]; then
  mkdir -p "$HOME/.config"
fi
if [ ! -d "$HOME/.local" ]; then
  mkdir -p "$HOME/.local"
fi

# bashrc
echo "source $HOME/.mybashrc" >> $HOME/.bashrc

# stow
stow --target=$HOME */
