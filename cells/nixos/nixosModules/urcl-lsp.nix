{ pkgs, ... }:
let
  lsp-framework = fetchzip {
    url = "https://github.com/leon-bckl/lsp-framework/archive/refs/heads/master.zip";
    sha256 = "sha256-MQEsRQnDi8GIKiU31OXXyPf7PR9B/g6pFJkL0b3vJGg=";
  };
  inherit (pkgs) stdenv fetchzip cmake git;
in 
stdenv.mkDerivation rec {
  pname = "urcl-lsp";
  version = "0.1.0";

  buildInputs = [ cmake git ];

  src = fetchzip {
    url = "https://github.com/Verlio-H/URCL-LSP/archive/refs/heads/main.zip";
    sha256 = "sha256-KM1+mIQAjhw1Ps6JTVJmnh94bNWIqMTgOt+vGMhy4Pk=";
  }; 

  postPatch = ''
    substituteInPlace CMakeLists.txt --replace 'GIT_REPOSITORY https://github.com/leon-bckl/lsp-framework.git' 'SOURCE_DIR ${lsp-framework}'
  '';

  buildPhase = ''
    cd ..
    cmake -S . -B $out && cmake --build $out --parallel
  '';

  installPhase = ''
    mkdir -p $out/bin 
    mv $out/urcl-lsp $out/bin 
  '';
}
