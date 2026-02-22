{ inputs, ... }:
{
  imports = [
    inputs.catppuccin.homeModules.catppuccin
  ];
  catppuccin = {
    enable = true;
    accent = "maroon";
    flavor = "frappe";
    alacritty.enable = true;
    btop.enable = true;
    cursors.enable = true;
    fish.enable = true;
    fuzzel.enable = true;
    fzf.enable = true;
    gtk.icon.enable = true;
    obs.enable = true;
    swaylock.enable = true;
    vivaldi.enable = true;
    yazi.enable = true;
  };
}
