{ config, pkgs, options, ... }:
let 
  unstable = builtins.fetchGit {
    url = https://github.com/nixos/nixpkgs;
    #sha256 = "0p98dwy3rbvdp6np596sfqnwlra11pif3rbdh02pwdyjmdvkmbvd";
    ref = "master";
  };
in
{
  imports = [
    ./hardware-configuration.nix
    ./nixpkgs-unstable.nix
    ./profiles/general.nix
  ];

  nixpkgs.config = {
    packageOverrides = pkgs: {
      unstable = import unstable {
        config = config.nixpkgs.config;
      };
    };
  };

  system.stateVersion = "19.09";  

  nix.nixPath =
    # Prepend default nixPath values.
    options.nix.nixPath.default ++ 
    # Append our nixpkgs-overlays.
    [ "nixpkgs-overlays=/etc/nixos/overlays/" ]
  ;
}
