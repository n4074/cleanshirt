{ config, pkgs, options, ... }: {
  system.stateVersion = "19.09";  
  # Whole-System configuration
  imports = [
    ./hardware-configuration.nix
    ./nixpkgs-unstable.nix
    ./profiles/general.nix
  ];

  nix.nixPath =
    # Prepend default nixPath values.
    options.nix.nixPath.default ++ 
    # Append our nixpkgs-overlays.
    [ "nixpkgs-overlays=/etc/nixos/overlays/" ]
  ;
}
