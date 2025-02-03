{ inputs, config, lib, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  imports = [
    ./hardware-configuration.nix
    ./system.nix
    ../../modules/pinkspaces-nixos
  ];
  
  networking.networkmanager.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.consoleLogLevel = 0;

  networking.hostName = "pinkspaces-nixos";
  
  time.timeZone = "Europe/Warsaw";
  
  users.users.pinkspaces = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    home = "/home/pinkspaces/";
    openssh.authorizedKeys.keyFiles = [ "/home/pinkspaces/.ssh/id_ed25519" ];
  };

  users.users.greeter = {
    isSystemUser = true;
    group = "greeter";
  };

  users.groups.greeter = {};
    
  system.stateVersion = "24.11"; # Did you read the comment?

}

