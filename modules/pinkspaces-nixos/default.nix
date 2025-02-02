{ inputs, pkgs, ... }:
{
  imports = [ ./hypr ./packages ./fonts ../common ];

  environment.systemPackages = [ pkgs.pavucontrol ];
  programs = {
    yazi.enable = true;
    git.enable = true;
  };
}
