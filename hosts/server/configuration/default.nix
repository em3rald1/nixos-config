_: {
  imports = [ 
    ./boot.nix 
    ./ssh.nix 
    ./users.nix 
    ./networking.nix 
    ./hardware-configuration.nix
  ];

  configuration.ssh.enable = true;
  configuration.networking = {
    enableHTTP = true;
    enableHTTPS = true;
    enableMinecraft = true;
    enablePorts = [ 8000 ];
  };
}
