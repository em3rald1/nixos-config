{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfiguration.pinkspaces-nixos = nixpkgs.lib.nixosSystem {
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./configuration.nix ];
      };
    };
}
