{
  inputs,
  pkgs,
  cell,
  lib,
  ...
}:
{
  imports = [ inputs.niri.nixosModules.niri ];
  # programs.niri.enable = true;
  environment.systemPackages = with pkgs; [
    kitty
    fuzzel
    inputs.niri.packages.niri-unstable
    xwayland-satellite
    wl-clipboard
  ];
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.dbus.implementation = "broker";
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
  };
  services.pulseaudio.enable = false;
  # xdg = {
  #   autostart.enable = true;
  #   menus.enable = true;
  #   mime.enable = true;
  #   icons.enable = true;
  #   portal = {
  #     enable = true;
  #     extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  #     configPackages = [
  #       inputs.niri.packages.niri-unstable
  #       # pkgs.kdePackages.dolphin
  #       pkgs.nautilus
  #     ];
  #   };
  # };
  # services.displayManager.sessionPackages = [ inputs.niri.packages.niri-unstable ];
  systemd.user.services.niri-flake-polkit = {
    enable = true;
    description = "PolicyKit Authentication Agent provided by niri-flake";
    wantedBy = [ "niri.service" ];
    after = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = lib.mkDefault "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  programs.dconf.enable = true;
  fonts.enableDefaultPackages = true;

  services.greetd = {
    enable = false;
    restart = true;
    settings.default_session = {
      command = "${lib.getExe pkgs.greetd.tuigreet} --time --cmd 'niri-session' --user-menu -r";
    };
  };
}
