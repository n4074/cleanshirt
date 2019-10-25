{ config, pkgs, options, ... }:

let 
  unstable = builtins.fetchGit {
    url = https://github.com/nixos/nixpkgs;
    #sha256 = "0p98dwy3rbvdp6np596sfqnwlra11pif3rbdh02pwdyjmdvkmbvd";
    ref = "master";
  };
in  
{
  imports = [
    ../modules/home-manager
  ];

  nixpkgs.config = {
    allowUnfree = true;

    packageOverrides = pkgs: {
      unstable = import unstable {
        config = config.nixpkgs.config;
      };
    };

  };

  system.stateVersion = "19.09";  

  nix.nixPath =
    # Prepend default nixPath values.
    options.nix.nixPath.default ++ 
    # Append our nixpkgs-overlays.
    [ "nixpkgs-overlays=/etc/nixos/overlays/" ]
  ;


  boot = {
    loader.systemd-boot.enable = true; # UEFI - switch to GRUB  if using BIOS
    loader.efi.canTouchEfiVariables = true;

    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [ "nomodeset" ]; # bugfix - https://github.com/NixOS/nixpkgs/issues/5829
  };


  environment.systemPackages = with pkgs; [ 
    binutils
    git
    neovim
    google-chrome
    termonad-with-packages
    compton
    feh
  ];

  services.xserver = {
    enable = true;
    windowManager.default = "xmonad";

    # TEMP: Fix macbook key bindings
    xkbModel = "macbook78";

    # For retina display
    dpi = 180;

    desktopManager.default = "none";
    desktopManager.xterm.enable = false;

    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      extraPackages = with pkgs.haskellPackages; haskellPackages: [ xmobar ];
    
      config = builtins.readFile ./home/dotfiles/xmonad.hs; # This will be superseded if a config exists at ~/.xmonad/xmonad.hs 
    };

    displayManager = {
      lightdm = {
        enable = true;
        greeters.mini = {
          enable = true;
          user = "user";
          extraConfig = ''
            [greeter]
            show-password-label = false
            show-input-cursor = false
            password-label-text = Something:

            [greeter-theme]
            window-color = "#ffbb29"
            layout-space = 10
          '';
        };

        background = "/etc/nixos/profiles/home/dotfiles/wallpaper.jpg";

      };

      setupCommands = "${pkgs.xorg.xrandr}/bin/xrandr --output default -s 3360x2100";
  
      sessionCommands = ''
        (sleep 2; feh --bg-fill /etc/nixos/profiles/home/dotfiles/wallpaper.jpg) &
      '';
    };
  };

  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    roboto
    roboto-mono
    dejavu_fonts
    liberation_ttf
    fira-code
    fira-code-symbols
  ];

  services.compton = {
    enable = true;
    shadow = true;
    inactiveOpacity = "0.90";
  };

  services.sshd.enable = true;

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

  home-manager.users.user = (import ./home/home.nix);
  home-manager.users.root = (import ./home/home.nix);
}