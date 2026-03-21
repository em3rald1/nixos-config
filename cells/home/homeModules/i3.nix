{ lib, pkgs, ... }:
{
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      bars = lib.mkForce [];
      colors = {
        background = "#dbd6d1";
        focused = {
          background = "#6d5782";
          border = "#a39a90";
          childBorder = "#576d82";
          indicator = "#6d5782";
          text = "#16130f";
        };
        focusedInactive = {
          background = "#2c2620";
          border = "#2c2620";
          childBorder = "#2c2620";
          indicator = "#5a5047";
          text = "#a39a90";
        };
        placeholder = {
          background = "#16130f";
          border = "#16130f";
          childBorder = "#16130f";
          indicator = "#16130f";
          text = "#a39a90";
        };
        unfocused = {
          background = "#16130f";
          border = "#2c2620";
          childBorder = "#2c2620";
          indicator = "#2c2620";
          text = "#a39a90";
        };
        urgent = {
          background = "#826d57";
          border = "#826d57";
          childBorder = "#826d57";
          indicator = "#826d57";
          text = "#16130f";
        };
      };
      window.titlebar = false;
      window.commands = [
        {
          criteria = {
            class = "^.*";
          };
          command = "border pixel 2";
        }
      ];
      focus.mouseWarping = true;
      focus.newWindow = "focus";
      gaps.outer = 4;
      gaps.inner = 4;
      modifier = "Mod4";
      fonts = [ "FiraCode Nerd Font" ];
      menu = "${pkgs.rofi}/bin/rofi";
      keybindings = lib.mkOptionDefault {
        "Mod4+space" = "exec ${pkgs.rofi}/bin/rofi -show drun";
        "Mod4+b"  = "exec ${pkgs.librewolf}/bin/librewolf";
        "Mod4+t" = "exec ${pkgs.kitty}/bin/kitty";
        "Mod4+q" = "kill";
        "Mod4+h" = "focus left";
        "Mod4+j" = "focus down";
        "Mod4+k" = "focus up";
        "Mod4+l" = "focus right";
        "Mod4+m" = "split toggle";
        "Mod4+v" = "floating toggle";
      };
      startup = [
        { command = "${pkgs.feh}/bin/feh --bg-fill /home/pinkspaces/Inkscape/background.png"; always = true; }
        { command = "${pkgs.quickshell}/bin/quickshell -c bar"; always = true; }
      ];
    };
  };
}
