let
  nixpkgs = import <nixpkgs> { };
  inherit (nixpkgs) fetchurl stdenv unzip;
in

stdenv.mkDerivation {
  pname = "catppuccin-cursors";
  version = "1.0";
  

  src = fetchurl {
    url = "https://github.com/catppuccin/cursors/releases/download/v1.0.2/catppuccin-mocha-dark-cursors.zip";
    sha256 = "sha256-jyJaa0bfLcTrrPT3X2LJs6P8jvKTZSR1X6KNoTFT8sA=";
  };

  buildInputs = [ unzip ];

  unpackPhase = "true";

  installPhase = ''
    mkdir -p $out/share/icons
    unzip $src -d $out/share/icons
  '';
}
