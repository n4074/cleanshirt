{ config, pkgs, ... }: {

  imports = [
    ../modules/common.nix
    ../modules/vmware-guest.nix
    ../modules/xmonad
    #../modules/termonad
    #../modules/home-manager
  ];

  services.sshd.enable = true;


  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [ 
    neovim
    git
    google-chrome
  ];

  users.defaultUserShell = pkgs.zsh;

  users.users.user = {
    isNormalUser = true;
    home = "/home/user";
    description = "user";
    extraGroups = [ "wheel" "networkmanager" ];
    openssh.authorizedKeys.keys = [ ];
  };

  users.users.root = {
    initialHashedPassword = ""; # initially empty root password
  };

  #home-manager.users.user = (import ./home/home.nix);
  #home-manager.users.root = (import ./home/home.nix);
}