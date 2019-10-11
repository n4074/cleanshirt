{ config, pkgs, ... }:
let 
  unstable = builtins.fetchGit {
    url = https://github.com/nixos/nixpkgs;
    ref = "master";
    #sha256 = "0p98dwy3rbvdp6np596sfqnwlra11pif3rbdh02pwdyjmdvkmbvd";
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