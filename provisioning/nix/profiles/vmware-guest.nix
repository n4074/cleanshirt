{ config, pkgs, ... }:
{
  imports = [
      ./general.nix
  ];

  virtualisation.vmware.guest.enable = true;
}