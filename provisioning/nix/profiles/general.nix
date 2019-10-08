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
    termonad-with-packages
  ];

  #users.defaultShell = programs.zsh;

  users.users.user = {
    isNormalUser = true;
    home = "/home/user";
    description = "System user";
    extraGroups = [ "wheel" "networkmanager" ];
    openssh.authorizedKeys.keys = [ ];
  };

  home-manager.users.users = {
    home.packages = [
      pkgs.htop
    ];
  };
}
