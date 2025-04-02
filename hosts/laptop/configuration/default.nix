_: {
  imports = [
    ./sound.nix
    ./boot.nix
    ./graphics.nix 
    ./bluetooth.nix
    ./networking.nix 
    ./devices.nix
    ./hardware.nix
    ./users.nix
  ];
  configuration = {
    bluetooth.enable = true;
    nvidia.enable = true;
  };
  networking.hostName = "pinkspaces-nixos";
}
