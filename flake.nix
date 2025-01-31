{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    /* home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    }; */
    hyprland.url = "github:hyprwm/Hyprland";
    # nixcord.url = "github:kaylorben/nixcord";
    # catppuccin.url = "github:catppuccin/nix";
    # catppuccin-cursors.url = "github:catppuccin/cursors";
    # waybar.url = "github:Alexays/Waybar";
    homix.url = "github:sioodmy/homix";

    wrapper-manager = {
      url = "github:viperML/wrapper-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, wrapper-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations.pinkspaces-nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs wrapper-manager; };
        modules = [ 
          ./hosts/pinkspaces-nixos 
        ];
      };
    };
}
