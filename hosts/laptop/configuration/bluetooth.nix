{ config, lib, ... }: 
let 
  cfg = config.configuration.bluetooth;
in {
  options.configuration.bluetooth = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enables bluetooth capabilities";
    };
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
