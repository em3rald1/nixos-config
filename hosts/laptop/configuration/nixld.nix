{ config, lib, pkgs, ... }: 
let 
  cfg = config.configuration.nix-ld;
in {
  options.configuration.nix-ld.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enables nix-ld";
  };

  config = lib.mkIf cfg.enable {
    programs.nix-ld = {
      enable = true;
      libraries = with pkgs; [
        stdenv.cc.cc.lib 
        xorg.libXcomposite
        xorg.libXtst
        xorg.libXrandr
        xorg.libXext
        xorg.libX11
        xorg.libXfixes
        xorg.libXt
        xorg.libXmu
        libGL
        libva 

        fontconfig
        freetype
        libogg 
        libvorbis 
        SDL 
        SDL2_image 
        glew110 
        libdrm 
        libidn 
        tbb 
        zlib
      ];
    };
  };
}
