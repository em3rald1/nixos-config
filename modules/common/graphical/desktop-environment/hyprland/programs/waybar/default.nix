{ config, lib, pkgs, ... }: 
let 
  cfg = config.modules.graphical.desktop-environment.hyprland.waybar;
in {
  options.modules.graphical.desktop-environment.hyprland.waybar.enable = 
    lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enables Waybar statusbar";
    }; 

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ waybar ];
  };
}
