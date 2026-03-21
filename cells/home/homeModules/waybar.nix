{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    style = ''
      * {
        color: #a39a90;
        background-color: #16130f;
        font-family: "FiraCode Nerd Font";
        font-size: 16px;
      }

      #language {
        margin: 0px 10px 0px 10px;
      }

      #clock {
        margin: 0px 10px 0px 0px;
      }

    '';
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        modules-left = [ "niri/workspaces" ];
        modules-center = [ "niri/window" ];
        modules-right = [
          "niri/language"
          "clock"
        ];

        "niri/workspaces" = {
          current-only = true;
          disable-click = true;
          format = "cw:{value}";
        };

        "niri/window" = { };

        "niri/language" = {
          format = "lg:{short}";
        };

        "clock" = {
          format = "{:%H:%M}";
          format-alt = "{:%A, %B %d, %Y (%R)}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            format = {
              months = "<span color='#57826d'><b>{}</b></span>";
              days = "<span color='#a39a90'><b>{}</b></span>";
              weeks = "<span color='#6d8257'><b>W{}</b></span>";
              weeksdays = "<span color='#a39a90'><b>{}</b></span>";
              today = "<span color='#82576d'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-click-right = "mode";
            on-click-forward = "tz_up";
            on-click-backward = "tz_down";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
        };
      };
    };
  };
}
