{ config, pkgs, ... }: {

  imports = [
    ../../nixpkgs-unstable.nix
    ./zsh.nix
  ];

  nixpkgs.config = import ./dotfiles/nixpkgs-config.nix;

  home.packages = [

  ];

  home.file = {
    ".xmonad/xmonad.hs".source = ./dotfiles/xmonad.hs;
    ".wallpaper.png".source = ./dotfiles/wallpaper.jpg;
  };

  xdg.configFile = {
    "termonad/termonad.hs".source = ./dotfiles/termonad.hs;
    "nixpkgs/config.nix".source = dotfiles/nixpkgs-config.nix;
  };

  xsession.pointerCursor = {
    name = "Vanilla-DMZ";
    package = pkgs.vanilla-dmz;
    size = 64;
  };
}