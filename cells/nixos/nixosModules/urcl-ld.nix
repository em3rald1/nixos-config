{ pkgs, ... }: 
let
  inherit (pkgs) stdenv fortran-fpm gfortran git fetchzip; 
in
stdenv.mkDerivation rec {
  pname = "urcl-ld";
  version = "1.0.0";

  buildInputs = [ fortran-fpm gfortran git ];

  src = fetchzip {
    url = "https://github.com/Verlio-H/urcl-ld/archive/refs/heads/main.zip";
    sha256 = "sha256-KWjNl+QhZOGWJrknGdN2+8TNt+GE9WtcyXVRFQBfnbc=";
  }; 

  buildPhase = ''
    fortran-fpm --prefix=$out install
    ls $out/bin
  '';

  installPhase = ''
  '';
}
