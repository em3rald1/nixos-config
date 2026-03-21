{
  services.syncthing = {
    enable = true;
    group = "users";
    user = "pink";
    dataDir = "/home/pink/Syncthing";
    configDir = "/home/pink/.config/syncthing";
  };
}
