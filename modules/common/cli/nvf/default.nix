{ config, pkgs, lib, inputs, ... }:
let 
  nvf-neovim =
    (inputs.nvf.lib.neovimConfiguration {
      inherit pkgs;
      modules = [ ./configuration.nix ];
    }).neovim;

  cfg = config.modules.cli.nvf;
in {
  options.modules.cli.nvf = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enables nvim infused with power of NVF";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.sessionVariables = {
      EDITOR = "vi";
    };
    environment.systemPackages = [ nvf-neovim ];
  };
}
