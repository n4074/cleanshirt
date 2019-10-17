{ config, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    compton
  ];
  services.xserver.enable = true;
  services.xserver.windowManager.default = "xmonad";

  # TODO: Refactor to select for macbook
  # TEMP: Temporary fix for MBP keyboard issue
  services.xserver.xkbModel = "macbook78";
  services.xserver.dpi = 180;


  services.xserver.desktopManager.default = "none";
  services.xserver.desktopManager.xterm.enable = false;

  services.xserver.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    extraPackages = with pkgs.haskellPackages; haskellPackages: [ xmobar ];
    
    /* # Not available until next release
    config = ''
      import XMonad
      import XMonad.Util.EZConfig
      main = launch $ def `additionalKeysP` myKeys
      myKeys = [ ("M-C-x", spawn "xterm") ]
    '';
    */
  };

  services.compton = {
    enable = true;
    shadow = true;
    inactiveOpacity = "0.90";
  };


  services.xserver.displayManager = {
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



#    setupCommands = "${pkgs.xorg.xrandr}/bin/xrandr --output default --gamma 0:0:0 --auto";
    setupCommands = "${pkgs.xorg.xrandr}/bin/xrandr --output default -s 3360x2100";

    sessionCommands = ''
      feh --bg-fill /etc/nixos/profiles/home/dotfiles/wallpaper.jpg &
    '';
  };
}