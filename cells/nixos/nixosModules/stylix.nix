{ pkgs, inputs, lib, ... }:
{
  imports = [ inputs.stylix.nixosModules.stylix ];
  stylix.enable = false;
  stylix.base16Scheme = ''
    scheme: "Purplicious"
    author: "pink"
    base01: "#000000"
    base02: "#1d0a2b"
    base03: "#381652"
    base04: "#512376"
    base05: "#693295"
    base06: "#8042b0"
    base07: "#9553c8"
    base08: "#a867dc"
    base09: "#78251d"
    base0A: "#553d00"
    base0B: "#255500"
    base0C: "#035f28"
    base0D: "#03555d"
    base0E: "#253d80"
    base0F: "#55257b"
  '';
}
