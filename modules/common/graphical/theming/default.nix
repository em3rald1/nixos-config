{ config, lib, inputs, ... }: 
let 
  cfg = config.modules.graphical.theming;
in {
  imports = [ inputs.stylix.nixosModules.stylix ];
  options.modules.graphical.theming.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enables stylix styling";
  };

  config = lib.mkIf cfg.enable {
    stylix.enable = true;
    stylix.autoEnable = true;
    stylix.base16Scheme = ./black-metal-gorgoroth.yaml; 
    stylix.targets = {
      qt.enable = true;
      chromium.enable = false;
      gtk.enable = true;
    };
  };

}
