{ inputs, pkgs, ... }: {
  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  homix.".config/hypr/hyprland.conf".source = ./hyprland.conf;
  environment.systemPackages = with pkgs; [ kitty ];
}
