{ config, pkgs, ... }:
let 
  unstabletarball = builtins.fetchtarball {
    url = https://github.com/nixos/nixpkgs-channels/archive/nixos-unstable.tar.gz;
    sha256 = "0p98dwy3rbvdp6np596sfqnwlra11pif3rbdh02pwdyjmdvkmbvd";
  };
in
{
  nixpkgs.config = {
    packageoverrides = pkgs: {
      unstable = import unstabletarball {
        config = config.nixpkgs.config;
      };
    };
  };
}