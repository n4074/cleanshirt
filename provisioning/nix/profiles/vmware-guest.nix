{ config, pkgs, ... }:
{
  imports = [
      ./common.nix
  ];

  virtualisation.vmware.guest.enable = true;
}