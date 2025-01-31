{ inputs, pkgs, ... }: {
  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  homix.".config/hypr/hyprland.conf".source = ./hyprland.conf;
  homix.".config/hypr/hyprpaper.conf".source = ./hyprpaper.conf;
  homix.".config/hypr/wallpapers".source = ./wallpapers;
  environment.systemPackages = with pkgs; [ kitty ];
}
