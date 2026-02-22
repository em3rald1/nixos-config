{ lib, ... }:
{
  services.udev.extraRules = (lib.fileContents ./50-qmk.rules) + "\n" + (lib.fileContents ./98-sayobot.rules);
}
