{ inputs, pkgs, ... }:
let
  pkgs-blockbench = import inputs.nixpkgs-blockbench { inherit (pkgs.stdenv.hostPlatform) system; };
in
{
  environment.systemPackages = with pkgs; [
    ueberzugpp
    libreoffice
    lutris
    jamesdsp
    vivaldi
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
    wineWowPackages.stable
    wine 
    wine64
    winetricks
    wineWowPackages.waylandFull
  ] ++ (with pkgs-blockbench; [ blockbench ]);
}
