{ config, lib, ... }: 
let 
  cfg = config.configuration.networking;
in {
  options.configuration.networking = {
    enableHTTP = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enables HTTP port";
    };

    enableHTTPS = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enables HTTPS port";
    }; 

    enableMinecraft = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enables Minecraft server port";
    };

    enablePorts = lib.mkOption {
      type = lib.types.listOf lib.types.port;
      default = [];
      description = "Enable additional ports";
    };
  };

  config = lib.attrsets.mergeAttrsList [
    {
      networking.networkmanager.enable = true;
      networking.firewall.allowedTCPPorts = cfg.enablePorts;
    }
    (lib.mkIf cfg.enableHTTP {
      networking.firewall.allowedTCPPorts = [ 80 ];
    })
    (lib.mkIf cfg.enableHTTPS {
      networking.firewall.allowedTCPPorts = [ 443 ];
    })
    (lib.mkIf cfg.enableMinecraft {
      networking.firewall.allowedTCPPorts = [ 25565 ];
    }) 
  ];
}
