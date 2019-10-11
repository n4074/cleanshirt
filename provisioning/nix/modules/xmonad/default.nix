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

  services.compton.enable = true;
}