{ config, pkgs, ... }:
let
  termonad = builtins.fetchGit {
    url = "https://github.com/cdepillabout/termonad";
    ref = "master";
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
    (import "${termonad}/.nix-helpers/termonad-with-packages.nix" { inherit additionalOverlays; })
  ];
}