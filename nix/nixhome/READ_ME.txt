## cai dat nix package manager
sh <(curl -L https://nixos.org/nix/install) --daemon
nix --version

## kích hoạt flakes
mkdir -p ~/.config/nix
echo 'experimental-features = nix-command flakes' >> ~/.config/nix/nix.conf

## home-manager
mkdir ~/nixhome
cd ~/nixhome
# create & activate configuration
nix run home-manager -- init --swtich
# install home-manager: standalone installation
# unstable branch
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
# and if you follow a Nixpkgs 25.05 channel you can run
nix-channel --add https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz home-manager
nix-channel --update
# Run the Home Manager installation command and create the first Home Manager generation:
nix-shell '<home-manager>' -A install
