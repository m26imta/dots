#!/usr/bin/env bash
set -euo pipefail

USER_NAME="${USER:?USER not set}"
HOME_DIR="${HOME:?HOME not set}"
SYSTEM="$(./detect-system.sh)"

echo "User: $USER_NAME"
echo "Home: $HOME_DIR"
echo "System: $SYSTEM"

echo home-manager switch \
  --flake ".#myconfig" \
  --impure \
  --argstr username "$USER_NAME" \
  --argstr homeDirectory "$HOME_DIR"

