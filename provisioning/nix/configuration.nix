{ config, pkgs, options, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./profiles/vmware-guest.nix
  ];
}
