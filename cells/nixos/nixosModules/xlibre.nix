{ pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.windowManager.i3.enable = true;
  services.xserver.enableTearFree = true;
  services.libinput.enable = true;
  services.libinput.mouse.accelProfile = "flat";
  services.xserver.modules = [
    pkgs.xorg.xf86inputlibinput
    pkgs.xorg.xf86videoamdgpu
    pkgs.xorg.xf86inputmouse
    pkgs.xorg.xf86inputkeyboard
    pkgs.xorg.xf86inputevdev
    pkgs.xorg.xf86inputjoystick
    pkgs.libinput
  ];
  services.displayManager.gdm.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
  services.xserver.xkb.layout = "pl,ru";
  services.xserver.xkb.options = "grp:alt_shift_toggle";
}
