{ config, lib, pkgs, ... }: 
let 
  cfg = config.modules.cli.fish;
in {
  options.modules.cli.fish.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable the best shell there is";
  };

  config = lib.mkIf cfg.enable {
    environment.sessionVariables = {
      FISH_HOME = "${pkgs.fish}/bin/fish";
      SHELL = "${pkgs.fish}/bin/fish";
    };
    environment.systemPackages = [ pkgs.fish ];
  };
}
