{ nixpkgs, pkgs, config, lib, ... }: 
let 
  cfg = config.modules.graphical.fonts;
in {
  options.modules.graphical.fonts.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Installs fonts";
  };

  config = lib.mkIf cfg.enable { 
    fonts.packages = with pkgs; [
      material-symbols
      libertinus 
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      liberation_ttf
      roboto
      font-awesome 
      (google-fonts.override { fonts = [ "Inter" ]; })
      jetbrains-mono
      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only
      nerd-fonts.ubuntu-mono 
      iosevka
      
    ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
  };
}
