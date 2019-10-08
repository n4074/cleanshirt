{ config, pkgs, ... }: {
  system.stateVersion = "19.03";  

  imports = [
    ./hardware-configuration.nix
    ./profiles/general.nix
  ];
}
