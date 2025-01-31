{ inputs, pkgs, ... }:
{
  imports = [ ./telegram ./hypr ./fonts ./rofi ./qutebrowser ../common ];
  environment.systemPackages = [ pkgs.pavucontrol ];
  programs = {
    yazi.enable = true;
    git.enable = true;
  };
}
