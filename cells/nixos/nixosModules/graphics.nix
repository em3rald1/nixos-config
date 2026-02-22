{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  hardware.graphics.extraPackages = with pkgs; [
    pkgs.mesa.drivers
    rocmPackages.clr.icd
  ];
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  environment.systemPackages = with pkgs; [ lact ];
  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = [ "multi-user.target" ];
  hardware.amdgpu.initrd.enable = true;
}
