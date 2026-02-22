{
  inputs,
  pkgs,
  cell,
  ...
}:
{
  imports = [
    inputs.hjem.nixosModules.default
  ]
  ++ (with inputs.cells.hjem.hjemModules; [
  ]);

  hjem = {
    linker = inputs.hjem.packages.${pkgs.stdenv.hostPlatform.system}.smfh;

    users.pink = {
      enable = true;
    };
  };
}
