{ inputs, cell, ... }:
{
  imports = [ inputs.catppuccin.nixosModules.catppuccin ];

  catppuccin = {
    enable = true;
    accent = "maroon";
    flavor = "frappe";
  };
}
