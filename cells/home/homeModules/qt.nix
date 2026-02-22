{ pkgs, ... }: {
  qt = {
    enable = true;
    style.package = pkgs.catppuccin-qt5ct;
    style.name = "kvantum";
    platformTheme.name = "qtct";
  };
}
