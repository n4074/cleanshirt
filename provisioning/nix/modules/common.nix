{ config, pkgs, ... }: {

  boot.loader.systemd-boot.enable = true; # UEFI - switch to GRUB  if using BIOS
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.kernelParams = [ "nomodeset" ]; # bugfix - https://github.com/NixOS/nixpkgs/issues/5829

}
