{ config, pkgs, ... }: {
  system.stateVersion = "19.03";  

  

  imports = [
    ./hardware-configuration.nix
    ./nixpkgs-unstable.nix
    ./profiles/general.nix
  ];
}
