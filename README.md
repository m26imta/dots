# dots
Run run_me_to_SETUP.sh to install dotfiles

# nix & home-manager
Install nix package manager:
    sh <(curl -L https://nixos.org/nix/install) --daemon
bootstrap home-manager:
    nix run home-manager -- switch --flake .#uuhmm



