{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland.inputs.nixpkgs.follows = "nixpkgs";
    catppuccin.url = "github:catppuccin/nix";
    stylix.url = "github:danth/stylix";
    wrapper-manager = {
      url = "github:viperML/wrapper-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf.url = "github:notashelf/nvf";
  };

  outputs = { self, nixpkgs, ... }@inputs: 
    let 
      inherit (pkgs) lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system}; 
      mkSystem = { hostName, directory ? hostName }: {
        "${hostName}" = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit system nixpkgs inputs lib; };
          modules = [ (./hosts/${directory}) ];
        };
      };
    in {
      nixosConfigurations = lib.attrsets.mergeAttrsList [
        (mkSystem { 
          hostName = "pinkspaces-nixos"; 
          directory = "laptop";
        }) 
        (mkSystem {
          hostName = "overlord-nixos"; 
          directory = "server";
        })
      ];
    };
}
