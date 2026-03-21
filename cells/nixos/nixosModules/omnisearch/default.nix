{ inputs, pkgs, ... }:
let
  omnisearch-pkg = inputs.omnisearch.packages.${pkgs.stdenv.hostPlatform.system}.omnisearchWith {
    templates = ./_templates;
    static = ./_static1;
  };
in
{
  environment.systemPackages = [ omnisearch-pkg ];

  users.users.omnisearch = {
    isSystemUser = true;
    group = "omnisearch";
    home = "/srv/omnisearch";
    createHome = true;
    description = "OmniSearch service user #1";
    shell = pkgs.bash;
  };

  users.groups.omnisearch = {};

  systemd.services.omnisearch = {
    description = "OmniSearch C metasearch engine";
    wants = ["network.target"];
    after = ["network.target"];
    wantedBy = ["multi-user.target"];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${omnisearch-pkg}/bin/omnisearch";
      Restart = "on-failure";
      WorkingDirectory = "/srv/omnisearch";
      User = "omnisearch";
      Group = "omnisearch";
      Environment = [
        "LD_LIBRARY_PATH=${omnisearch-pkg}/lib"
        "HOME=/srv/omnisearch"
      ];
    };
  };
}
