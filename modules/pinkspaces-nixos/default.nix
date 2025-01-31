{ inputs, pkgs, ... }:
{
  imports = [ ./hypr ./fonts ./rofi ./qutebrowser ../common ];
  programs = {
    yazi.enable = true;
    git.enable = true;
  };
}
