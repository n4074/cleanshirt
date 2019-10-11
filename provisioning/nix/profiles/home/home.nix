{ config, pkgs, ... }: {

  imports = [
    ../../nixpkgs-unstable.nix
    ./zsh.nix
  ];

  home.packages = [
#    pkgs.terminad-with-packages
  ];

  home.file = {
    ".xmonad/xmonad.hs".source = ./xmonad.hs;
    ".config/termonad/termonad.hs".source = ./termonad.hs;
  };



}