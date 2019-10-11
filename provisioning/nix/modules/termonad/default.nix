{ config, pkgs, ... }:
let
  termonad = builtins.fetchGit {
    url = "https://github.com/cdepillabout/termonad";
    ref = "master";
  };

  nixpkgs = builtins.fetchGit {
    url = "https://github.com/NixOS/nixpkgs";
    rev = "64e38f246aebc1fcd800952322c08f92d1420660";
  };

  additionalOverlays = [
    (self: super: {
      haskell = super.haskell // {
        packageOverrides = hself: hsuper:
          super.haskell.packageOverrides hself hsuper // {
            termonad = self.haskell.lib.dontCheck hsuper.termonad;
          };
      };
    })
  ];
in
{
  environment.systemPackages = with pkgs; [
    (import "${termonad}/.nix-helpers/termonad-with-packages.nix" { inherit additionalOverlays nixpkgs; })
  ];
}