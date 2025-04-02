{ lib, ... }: 
let
  fns = import ../../common/functions/users.nix;
  inherit (fns) mkUser mkGroup;
in {
  users.users = lib.attrsets.mergeAttrsList [
    (mkUser {
      username = "pinkspaces";
      extraGroups = [ "wheel" "networkmanager" "audio" ];
    })
  ];
}
