{ config, lib, pkgs, ... }:
let
  cfg = config.modules.bluetooth;
in {
  options.modules.bluetooth.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enables bluetooth support";
  };

  config = lib.mkIf cfg.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings.General.Enable = "Source,Sink,Media,Socket";
    };

    services.blueman.enable = true;
  };
}
