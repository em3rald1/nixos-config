{
  inputs,
  cell,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [ catppuccin-gtk ];
}
