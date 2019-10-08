{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [ termonad-with-packages ];
}
