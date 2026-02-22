{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (prismlauncher.override {
      jdks =
        with pkgs; [ jdk17 jdk21 jdk25 ];
    })
    libx11
    mesa
    libxi
  ];
  services.xserver.videoDrivers = [ "amdgpu" ];
}
