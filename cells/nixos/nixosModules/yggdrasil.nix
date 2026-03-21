# IPv6 address:      	200:915e:5756:8cec:d8ca:b58b:5a3b:7ce3                          	
# IPv6 subnet:       	300:915e:5756:8cec::/64
let 
  address = "200:915e:5756:8cec:d8ca:b58b:5a3b:7ce3";
  prefix = "300:915e:5756:8cec";
in
{
  services.yggdrasil = {
    enable = true;
    persistentKeys = true;
    openMulticastPort = true;

    settings = {
      IfMTU = 65535;
      Peers = [
        "tls://193.93.119.42:443"
        "tcp://193.93.119.42:14244"
        "quic://94.159.111.184:65535"
      ];
    };
  };
  boot.kernel.sysctl."net.ipv6.conf.all.forwarding" = 1;

  networking.interfaces.wlp4s0.ipv6.addresses = [
    {
      address = prefix + "::1";
      prefixLength = 64;
    }
  ];

  # services.radvd = {
  #   enable = true;
  #   config = ''
  #     interface wlp4s0
  #     {
  #       AdvSendAdvert on;
  #       prefix ${prefix}::/64 {
  #         AdvOnLink on;
  #         AdvAutonomous on;
  #       };
  #       route 200::/8 {};
  #     };
  #   '';
  # };

  vhosts.website = {
    address = "127.0.0.1";
    port = 8000;
  };
}
