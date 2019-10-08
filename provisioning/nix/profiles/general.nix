{ config, pkgs, ... }: {

  imports = [
    ../modules/common.nix
    ../modules/vmware-guest.nix
    ../modules/xmonad
    ../modules/termonad
    ../modules/zsh
    ../modules/home-manager
  ];

  services.sshd.enable = true;

  users.users.root.initialHashedPassword = ""; # initially empty root password

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [ 
    neovim
    git
    google-chrome
    #termonad-with-packages
  ];

  #users.defaultShell = programs.zsh;

  users.users.user = {
    isNormalUser = true;
    home = "/home/user";
    description = "user";
    extraGroups = [ "wheel" "networkmanager" ];
    openssh.authorizedKeys.keys = [ ];
    initialHashedPassword = "";
  };

  home-manager.users.user = (import ./home/home.nix);
  home-manager.users.root = (import ./home/home.nix);
}