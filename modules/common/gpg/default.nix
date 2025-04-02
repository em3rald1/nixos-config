{ config, lib, pkgs, ... }:
let 
  cfg = config.modules.gpg;
in {
  options.modules.gpg.enable = lib.mkOption {      
    type = lib.types.bool;
    default = false;
    description = "Enables GPG service";
  };

  config = lib.mkIf cfg.enable {
    services.pcscd.enable = true;
    programs.gnupg.agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-curses;
    };
  };
}
