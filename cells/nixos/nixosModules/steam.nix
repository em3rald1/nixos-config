{
  inputs,
  cell,
  pkgs,
  ...
}:
{
  programs.steam.enable = true;
  programs.steam.package = pkgs.millennium-steam;
  environment.systemPackages = with pkgs; [ mangohud ];
  services.pulseaudio.support32Bit = true;
}
