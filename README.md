# dots
Run run_me_to_SETUP.sh to install dotfiles

# nix & home-manager
Install nix package manager:
    sh <(curl -L https://nixos.org/nix/install) --daemon
bootstrap home-manager:
    nix run home-manager -- switch --flake .#uuhmm
    nix run home-manager -- switch --flake ".#uuhmm"
    nix run home-manager -- switch --flake ".#uuhmm" --impure -b __backup \
      --argstr username "${USER:?USER not set}" \
      --argstr homeDirectory "${HOME:?HOME not set}" \
      --argstr system "${./detect-system.sh}"


------
# Darwin
0. Install xcode command line tools:
    xcode-select --install
1. Install homebrew:
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
2. Install stow, wezterm, nerd-font
    brew install stow
    brew install --cask wezterm
    brew install --cask font-jetbrains-mono-nerd-font
1. run_me_to_SETUP.sh to stow the dotfiles
2. nix-package-manager:
    - Install nix package manager: 
        sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)
    - bootstrap home-manager:
        cd ~/nixhome
        ./hm.sh
            OR run: nix run home-manager -- switch --flake ".#uuhmm" --impure -b __backup


--------
#Ubuntu
0. apt update && apt upgrade
    sudo apt update && sudo apt upgrade -y
1. sudo apt install stow
2. Install nerd-fonts
    mkdir -p $HOME/.fonts/JetBrainsMono
    curl -Lo https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
    file JetBrainsMono.zip
    unzip JetBrainsMono.zip -d $HOME/.fonts/JetBrainsMono/
    fc-cache -fv
    fc-list | grep "JetBrainsMono"
1. run_me_to_SETUP.sh to stow the dotfiles
2. nix-package-manager:
    - Install nix package manager: 
        sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
    - bootstrap home-manager:
        cd ~/nixhome
        ./hm.sh
            OR run: nix run home-manager -- switch --flake ".#uuhmm" --impure -b __backup
