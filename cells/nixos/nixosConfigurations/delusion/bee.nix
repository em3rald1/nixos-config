{ inputs, ... }:
rec {
  system = "x86_64-linux";
  pkgs = import inputs.nixpkgs-stable {
    inherit system;
    config.allowUnfree = true;
    overlays = [
      # (final: prev: {
      #   inherit (prev.lixPackageSets.stable)
      #     nix-eval-jobs
      #     nixpkgs-review;
      # })
      # inputs.lix-module.overlays.default
      inputs.niri.overlays.niri
      # inputs.millennium.overlays.default
      inputs.xlibre-overlay.overlays.xlibre-xserver
      inputs.xlibre-overlay.overlays.xlibre-xf86-video-amdgpu
      inputs.xlibre-overlay.overlays.xlibre-xf86-input-libinput
      inputs.xlibre-overlay.overlays.xlibre-xf86-input-keyboard
      inputs.xlibre-overlay.overlays.xlibre-xf86-input-evdev
      inputs.xlibre-overlay.overlays.xlibre-xf86-input-mouse
      inputs.xlibre-overlay.overlays.xlibre-xf86-input-joystick
    ];
  };
  home = inputs.home-manager;
}
