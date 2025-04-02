{ pkgs, ... }: {
  imports = [ ../common ];

  modules.cli = {
    aesthetic.enable = true;
    fish.enable = true;
    nvf.enable = true;
    tools.enable = true;
  };

  modules.gpg.enable = true;

  modules.graphical = {
    gaming.enable = true;
    theming.enable = true;
    fonts.enable = true;
    desktop-manager.greetd.enable = true;
    desktop-environment.hyprland = {
      enable = true;
      dunst.enable = true;
      kitty.enable = true;
      rofi.enable = true;
      waybar.enable = true;
    };
  };

  programs = {
    thunderbird.enable = true;
    thunar.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-termfilechooser ];
    xdgOpenUsePortal = true;
    config = {
      common = {
        default = [ "hyprland;termfilechooser;gtk" ];
        "org.freedesktop.impl.portal.FileChooser" = [ "termfilechooser" ];
      };
    };
  };
  environment.systemPackages = with pkgs; [
    vivaldi mpv grim slurp legcord kdePackages.dolphin
    kdePackages.qtsvg
    galaxy-buds-client bitwarden telegram-desktop
    obs-studio ungoogled-chromium tor-browser-bundle-bin libreoffice
  ];
}
