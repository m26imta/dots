#!/usr/bin/env bash
set -euo pipefail

# detect-system
arch="$(uname -m)"
os="$(uname -s)"

if [[ "$arch" == "arm64" ]]; then
  arch="aarch64"
fi
if [[ "$os" == "Darwin" ]]; then
  os="darwin"
elif [[ "$os" == "Linux" ]]; then
  os="linux"
else
  echo "Unsupported OS: $os" >&2
  exit 1
fi
os=$(uname -s | tr '[:upper:]' '[:lower:]')

USER_NAME="${USER:?USER not set}"
HOME_DIR="${HOME:?HOME not set}"
SYSTEM="${arch}-${os}"

nix run home-manager -- switch \
  --flake ".#uuhmm" \
  --impure \
  --argstr username "$USER_NAME" \
  --argstr homeDirectory "$HOME_DIR" \
  --argstr system "$SYSTEM"

