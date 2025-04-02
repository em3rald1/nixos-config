_: {
  time.timeZone = "Europe/Warsaw";
  nix.settings.experimental-features = [ "flakes" "nix-command" ];
  # nixpkgs.hostPlatform = system;
  networking.networkmanager.enable = true;
}
