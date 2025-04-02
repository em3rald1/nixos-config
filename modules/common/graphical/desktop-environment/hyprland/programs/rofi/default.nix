{ config, lib, pkgs, ... }: 
let 
  cfg = config.modules.graphical.desktop-environment.hyprland.rofi;
in {
  options.modules.graphical.desktop-environment.hyprland.rofi.enable = 
    lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enables rofi-wayland application launcher";
    };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ rofi-wayland ];
  };
}
