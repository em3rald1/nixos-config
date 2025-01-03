{ config, lib, pkgs, ... }:

{
  imports =
    [
	./nixos-imports/lamp_stack.nix
	./nixos-imports/monitor_managers.nix
	./nixos-imports/programs.nix
	./nixos-imports/toolchain.nix
	./nixos-imports/user_interface.nix
	./nixos-imports/development.nix
	./hardware-configuration.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.networkmanager.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "pinkspaces-nixos";
  
  time.timeZone = "Europe/Warsaw";

  services.xserver = { 
    enable = true;
  };
  programs.hyprland.enable = true;

  xdg.portal.enable = true;

  users.users.pinkspaces = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    home = "/home/pinkspaces/";
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
  };
  services.libinput.enable = true;

  services.openssh.enable = true;
  system.copySystemConfiguration = true;

  system.stateVersion = "24.11"; # Did you read the comment?

}

