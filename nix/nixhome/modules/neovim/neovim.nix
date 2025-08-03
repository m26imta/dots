# modules/neovim/neovim.nix
{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    "neovim"
  ];
}
