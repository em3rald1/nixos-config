{ wrapper-manager, pkgs, ... }: {
  environment.systemPackages = [
    (wrapper-manager.lib.build {
      inherit pkgs;
      modules = [
        ./helix
      ];
    })
  ];
}
