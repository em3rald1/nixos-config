{ inputs, ... }:
rec {
  system = "x86_64-linux";
  pkgs = import inputs.nixpkgs-unstable {
    inherit system;
    config.allowUnfree = true;
    overlays = [
      (final: prev: {
        inherit (prev.lixPackageSets.stable)
          nix-eval-jobs
          nixpkgs-review;
      })
      # inputs.lix-module.overlays.default
      inputs.niri.overlays.niri
      inputs.millennium.overlays.default
    ];
  };
  home = inputs.home-manager;
}
