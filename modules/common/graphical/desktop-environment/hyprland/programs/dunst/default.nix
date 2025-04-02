{ config, lib, pkgs, ... }: 
let 
  cfg = config.modules.graphical.desktop-environment.hyprland.dunst;
in {
  options.modules.graphical.desktop-environment.hyprland.dunst.enable =
    lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enables dunst notification service";
    };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ libnotify dunst ];
  };
}
