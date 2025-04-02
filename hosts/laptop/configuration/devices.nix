_: {
  services.libinput = {
    enable = true;
    touchpad.tapping = true;
    touchpad.naturalScrolling = true;
  }; 
  services.ratbagd.enable = true;
}
