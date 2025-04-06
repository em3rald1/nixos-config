{ config, lib, pkgs, ... }: 
let
  cfg = config.modules.cli.nh;
in {
  options.modules.cli.nh.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enables nh nix CLI helper";
  };

  config = lib.mkIf cfg.enable {
    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "/home/pinkspaces/Projects/nixos";
    };
  };
}
