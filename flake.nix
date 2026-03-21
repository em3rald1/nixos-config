{
  description = "A very basic flake";

  inputs = {
    nixpkgs-stable.url = "github:nixos/nixpkgs/25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/master";
    nixpkgs.follows = "nixpkgs-stable";
    nixpkgs-graalvm.url = "github:nixos/nixpkgs/9957cd48326fe8dbd52fdc50dd2502307f188b0d";
    nixpkgs-blockbench.url = "github:nixos/nixpkgs/45ebaee5d90bab997812235564af4cf5107bde89";
    quickshell.url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
    quickshell.inputs.nixpkgs.follows = "nixpkgs";

    hive.url = "github:divnix/hive";
    hive.inputs.nixpkgs.follows = "nixpkgs";
    std.url = "github:divnix/std";
    std.inputs.nixpkgs.follows = "nixpkgs";
    hjem.url = "github:feel-co/hjem";
    hjem.inputs.nixpkgs.follows = "nixpkgs";
    # millennium.url = "github:pinkspaces/Millennium?dir=packages/nix";
    # millennium.inputs.nixpkgs.follows = "nixpkgs";
    niri.url = "github:sodiboo/niri-flake";
    niri.inputs.nixpkgs.follows = "nixpkgs";
    nixago.url = "github:nix-community/nixago";
    nixago.inputs.nixpkgs.follows = "nixpkgs";
    nvf.url = "github:notashelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";
    lix-module.url = "https://git.lix.systems/lix-project/nixos-module/archive/main.tar.gz";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    catppuccin.url = "github:catppuccin/nix";
    catppuccin.inputs.nixpkgs.follows = "nixpkgs";
    swww.url = "github:LGFae/swww";
    stylix.url = "github:nix-community/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
    xlibre-overlay.url = "git+https://codeberg.org/takagemacoed/xlibre-overlay";
    # xlibre-overlay.inputs.nixpkgs.follows = "nixpkgs";
    xlibre-overlay.inputs.xlibre-drivers-overlay-choice.follows = "xlibre-driver-choice";
    # xlibre-overlay.inputs.xserver-meson-flags.follows = "xlibre-xserver-build-options";
    xlibre-overlay.inputs.fetchurl-sources.follows = "xlibre-fetchurl-sources";
    xlibre-driver-choice = {
      url = "path:./xlibre-build-options/driver-choice.nix";
      flake = false;
    };
    # xlibre-xserver-build-options = {
    #   url = "path:./xlibre-build-options/xserver-build-options.nix";
    #   flake = false;
    # };
    xlibre-fetchurl-sources = {
      url = "path:./xlibre-build-options/fetchurl-sources.nix";
      flake = false;
    };
    omnisearch = {
      url = "git+https://git.alovely.space/Nyx/OmniSearch.git";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.omnisearch.follows = "omnisearch";
    };
  };

  outputs =
    {
      self,
      std,
      hive,
      ...
    }@inputs:
    hive.growOn
      {
        inherit inputs;
        cellsFrom = ./cells;
        cellBlocks =
          with hive.blockTypes;
          with std.blockTypes;
          [
            nixosConfigurations
            homeConfigurations
            (functions "nixosModules")
            (functions "hardwareProfiles")

            (functions "hjemModules")
            (functions "homeModules")
          ];
      }
      {
        nixosConfigurations = hive.collect self "nixosConfigurations";
      };
}
