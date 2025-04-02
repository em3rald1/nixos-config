{ config, lib, inputs, system, pkgs, ... }:
let
  cfg = config.modules.graphical.desktop-environment.hyprland;
in {
  imports = [ ./programs ]; 

  options.modules.graphical.desktop-environment.hyprland.enable =
    lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enables Hyprland desktop environment";
    };

  config = lib.mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${system}.hyprland;
      portalPackage = 
        inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland;
    };

    environment.systemPackages = with pkgs; [ hyprpaper wl-clipboard hyprpicker grim slurp ];
    environment.sessionVariables = {
      DESKTOP_ENVIRONMENT = "${inputs.hyprland.packages.${system}.hyprland}/bin/Hyprland";
    };
  };
}
