{ inputs, pkgs, ... }:
{
  imports = [ ./bitwarden ./telegram ./hypr ./fonts ./rofi ./qutebrowser ../common ];
  environment.systemPackages = [ pkgs.pavucontrol ];
  programs = {
    yazi.enable = true;
    git.enable = true;
  };
}
