#!/usr/bin/env bash

if [ ! -d "$HOME/.config" ]; then
  mkdir -p "$HOME/.config"
fi
if [ ! -d "$HOME/.local" ]; then
  mkdir -p "$HOME/.local"
fi
stow --target=$HOME */
