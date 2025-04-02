{ config, lib, pkgs, ... }: 
let 
  cfg = config.modules.graphical.desktop-manager.greetd;
in {
  options.modules.graphical.desktop-manager.greetd.enable =
    lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enables greetd as a desktop manager";
    };

  config = lib.mkIf cfg.enable {
    services.greetd = {
      enable = true;
      vt = 2;
      settings.default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "greeter";
      }; 
    };
  };
}
