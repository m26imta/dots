#!/usr/bin/env bash
set -euo pipefail

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

# or use this nix command
# nix eval --impure --expr 'builtins.currentSystem' --raw

echo "${arch}-${os}"

