{ inputs, pkgs, ... }:
{
  imports = [ ./greetd ./hypr ./packages ./fonts ../common ];

  environment.systemPackages = [ pkgs.pavucontrol ];
  programs = {
    yazi.enable = true;
    git.enable = true;
  };
}
