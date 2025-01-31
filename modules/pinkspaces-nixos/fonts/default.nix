{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    material-symbols
    libertinus
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    roboto
    (google-fonts.override { fonts = [ "Inter" ]; })

    jetbrains-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
  ];

  fonts.enableDefaultPackages = false;
}
