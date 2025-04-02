{ config, lib, pkgs, ... }: 
let
  cfg = config.modules.cli.tools;
in {
  options.modules.cli.tools.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Installs essential CLI tools for quality of life";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      yazi git unzip zip bat lsd 
      ripgrep ffmpeg fzf android-tools wget 
      zoxide gnupg fastfetch libnotify
      pass bat playerctl texliveFull
    ];
  };
}
