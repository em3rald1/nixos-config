{ config, lib, pkgs, ... }: 
let 
  cfg = config.modules.graphical.desktop-environment.hyprland.kitty;
in {
  options.modules.graphical.desktop-environment.hyprland.kitty.enable =
    lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enables kitty terminal emulator";
    };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ kitty ];
  };
}
