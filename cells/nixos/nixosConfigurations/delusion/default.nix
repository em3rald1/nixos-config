{
  inputs,
  config,
  lib,
  pkgs,
  cell,
  ...
}:
{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  users.users.pink = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "network"
      "yggdrasil"
    ];
  };
  # nix.package = pkgs.lixPackageSets.stable.lix;
  nix.package = pkgs.nixVersions.latest;
  time.timeZone = "Europe/Warsaw";
  i18n.defaultLocale = "en_US.UTF-8";
  system.stateVersion = "25.11";
  boot.kernelPackages = pkgs.linuxPackagesFor pkgs.linux_latest;
  networking.networkmanager.enable = true;
  networking.hostId = "c0000001";

  modules = {
    cli.enable = true;
    bluetooth.enable = true;
    nvf.enable = true;
  };

  home-manager.users.pink.imports = [
    inputs.cells.home.homeConfigurations.pink
  ];
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  imports =
    (with cell.hardwareProfiles; [ delusion ])
    ++ (with cell.nixosModules; [
      cli
      gtk
      # hjem
      omnisearch
      niri
      graphics
      udev
      bluetooth
      nvf
      xlibre
      yggservice
      apps
      fonts
      # stylix
      searxng
      steam
      # catppuccin
      davinci-resolve
      prism-launcher
      openrgb
      nix-ld
      qt
      plymouth
      yggdrasil
      firewall
      syncthing
    ]);
}
