{ config, pkgs, ... }: {
  system.stateVersion = "19.03";  
  # Whole-System configuration
  imports = [
    ./hardware-configuration.nix
    ./nixpkgs-unstable.nix
    ./profiles/general.nix
  ];
}
