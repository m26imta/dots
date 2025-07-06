#!/usr/bin/env bash

mkdir -p $HOME/.config
mkdir -p $HOME/.local/{share, fonts}

# bashrc
echo "source $HOME/.mybashrc" >> $HOME/.bashrc

# stow
stow --target=$HOME */
