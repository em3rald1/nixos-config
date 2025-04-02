{ config, lib, pkgs, ... }:
let
  cfg = config.modules.cli.aesthetic;
in {
  options.modules.cli.aesthetic.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enables aesthetic CLI features";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ cava tenki btop ];
  };
}
