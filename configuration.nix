{ config, lib, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  imports = [
    ./hardware-configuration.nix
  ];

  environment.systemPackages = with pkgs; [
    git
    vim
  ];

  networking.networkmanager.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "pinkspaces-nixos";
  
  time.timeZone = "Europe/Warsaw";

  users.users.pinkspaces = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    home = "/home/pinkspaces/";
    openssh.authorizedKeys.keyFiles = [ "/home/pinkspaces/.ssh/id_ed25519" ];
  };

  #security.rtkit.enable = true;
  #services.pipewire = {
  #  enable = true;
  #  pulse.enable = true;
  #  alsa.enable = true;
  #  alsa.support32Bit = true;
  #  jack.enable = true;
  #};
  #services.libinput = {
  #  enable = true;
  #  touchpad.tapping = true;
  #  touchpad.naturalScrolling = true;
  #};
  #services = {
  #  fwupd.enable = true;
  #  thermald.enable = true;
  #};
  #services.openssh.enable = true;
  #system.copySystemConfiguration = true;


  #services.tlp.enable = true;
  #services.tlp.settings = {
  #  CPU_ENERGY_PERF_POLICY_ON_AC = "power";
  #  CPU_ENERGY_PERF_POLITY_ON_BAT = "power";
  # 
  #  CPU_BOOST_ON_AC = 1;
  #  CPU_BOOST_ON_BAT = 1;
  # 
  #  CPU_HWP_DYN_BOOST_ON_AC = 1;
  #  CPU_HWP_DYN_BOOST_ON_BAT = 1;
  #
  #  PLATFORM_PROFILE_ON_AC = "performance";
  #  PLATFORM_PROFILE_ON_BAT = "performance";

  #  INTEL_GPU_MIN_FREQ_ON_AC = 500;
  #  INTEL_GPU_MIN_FREQ_ON_BAT = 500;
  #};

  # powerManagement.cpuFreqGovernor = "performance";

  system.stateVersion = "24.11"; # Did you read the comment?

}

