{ config, lib, ... }: 
let 
  cfg = config.configuration.ssh;
in {
  options.configuration.ssh = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enables SSH connectivity";
    };
  };

  config = lib.mkIf cfg.enable {
    services.openssh = {
      enable = true;
      ports = [ 22 ];
      settings = {
        PasswordAuthentication = true;
        AllowUsers = [ "ssh" ];
        UseDns = true;
        X11Forwarding = false;
        PermitRootLogin = false;
      };
    };

    networking.firewall.allowedTCPPorts = [ 22 ];
  };
}
