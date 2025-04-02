{ config, lib, pkgs, ... }: 
let
  cfg = config.modules.graphical.gaming;
in {
  options.modules.graphical.gaming.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enables a gaming suite";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      steam
      lutris
      wineWowPackages.stable
      wineWowPackages.waylandFull
      winetricks
      prismlauncher
      osu-lazer
    ];
  };
}
