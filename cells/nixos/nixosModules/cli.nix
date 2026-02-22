{ config, lib, pkgs, ... }:
let
  cfg = config.modules.cli;
in {
  options.modules.cli.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enables useful CLI tools";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      yazi mmv git unzip zip bat lsd ripgrep file ffmpeg fzf android-tools wget gnupg fastfetch
      libnotify pass playerctl texliveFull tmux brightnessctl pwvucontrol fish cava tenki btop
    ];
    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 7d --keep 8";
    };
    environment.sessionVariables = {
      FISH_HOME = "${pkgs.fish}/bin/fish";
      SHELL = "${pkgs.fish}/bin/fish";
    };
  };
}
