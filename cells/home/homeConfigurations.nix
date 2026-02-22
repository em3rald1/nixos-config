{ inputs, cell }:
rec {
  pink = {
    imports = with cell.homeModules; [
      catppuccin
      alacritty
      qt
      niri
      gtk
      obs
      kitty
      fuzzel
      fish
      waybar
      vivaldi
      swww
      xdg
    ];

    programs.home-manager.enable = true;

    home = {
      stateVersion = "25.05";
      username = "pink";
      homeDirectory = "/home/pink";
    };
  };

}
