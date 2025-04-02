{ lib, ... }: 
let 
  user-utils = import ../../common/functions/users.nix;
  inherit (user-utils) mkUser mkGroup;
in {
  users.users = lib.attrsets.mergeAttrsList [
    (mkUser {
      username = "server";
      extraGroups = [ "wheel" "networkmanager" "server-manager" ];
    })
    (mkUser {
      username = "ssh";
      extraGroups = [ "wheel" "networkmanager" "server-manager" ];
      home = "server";
    })
  ];

  users.groups = lib.attrsets.mergeAttrsList [
    (mkGroup {
      name = "server-manager";
    })
  ];
}
