{ config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true; # (for UEFI systems only)
  boot.loader.efi.canTouchEfiVariables = true;

  services.sshd.enable = true;

  users.users.root.initialHashedPassword = ""; # initially empty root password
  system.stateVersion = "19.03";  
}
