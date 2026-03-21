{ inputs, pkgs, ... }:
let
  pkgs-blockbench = import inputs.nixpkgs-blockbench { inherit (pkgs.stdenv.hostPlatform) system; };
in
{
  environment.systemPackages = with pkgs; [
    ueberzugpp
    gajim
    inkscape
    keepassxc
    libreoffice
    lutris
    jamesdsp
    vivaldi
    librewolf
    vesktop
    telegram-desktop
    mpv
    easyeffects
    gamescope
    gamemode
    kdePackages.kdenlive
    heroic
    # waybar
    plugdata
    lmms
    strawberry
    wine 
    wine64
    winetricks
    (discord.override {
      # withOpenASAR = true;
      withVencord = true;
    })
    inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default
  ] ++ (with pkgs-blockbench; [ blockbench ]);
}
