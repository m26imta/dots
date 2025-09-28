{
  description = "Home Manager configuration of uu";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    #or: nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = builtins.currentSystem;
      pkgs = nixpkgs.legacyPackages.${system};
      username = builtins.getEnv "USER";
      homeDirectory = builtins.getEnv "HOME";
    in
    {
      homeConfigurations."uuhmm" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./home.nix
          # ./new-module.nix
          #
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
        # Truyền biến cho home.nix
        extraSpecialArgs = {
          inherit username;
          homeDirectory = homeDirectory;
        };
      };
    };
}
