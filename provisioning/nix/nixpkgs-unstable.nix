{ config, pkgs, ... }:
let 
  unstable = builtins.fetchGit {
    url = https://github.com/nixos/nixpkgs;
    #sha256 = "0p98dwy3rbvdp6np596sfqnwlra11pif3rbdh02pwdyjmdvkmbvd";
    ref = "master";
  };
in
{
  nixpkgs.config = {
    packageOverrides = pkgs: {
      unstable = import unstable {
        config = config.nixpkgs.config;
      };
    };
  };
}