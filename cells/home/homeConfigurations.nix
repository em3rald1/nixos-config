{ inputs, cell }:
rec {
  pink = {
    imports = with cell.homeModules; [
      # catppuccin
      i3
      # stylix
      quickshell
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
      stateVersion = "25.11";
      username = "pink";
      homeDirectory = "/home/pink";
    };
  };

}
