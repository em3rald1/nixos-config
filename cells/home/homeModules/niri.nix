{ inputs, ... }:
{
  programs.niri = {
    # enable = tre;
    settings = {
      prefer-no-csd = true;
      input = {
        keyboard = {
          xkb = {
            layout = "pl,ru";
            options = "grp:alt_shift_toggle";
          };

          numlock = true;
          repeat-rate = 40;
        };

        touchpad.enable = false;
        mouse.accel-profile = "flat";
        trackpoint.enable = false;
        warp-mouse-to-focus.enable = true;
        focus-follows-mouse.enable = true;
      };

      outputs = {
        "HDMI-A-2" = {
          mode = {
            height = 1080;
            width = 1440;
            refresh = 74.986;
            # refresh =
          };
        };
      };

      layout = {
        gaps = 8;
        center-focused-column = "never";

        preset-column-widths = [
          { proportion = 1. / 3.; }
          { proportion = 1. / 2.; }
          { proportion = 2. / 3.; }
        ];

        default-column-width = {
          proportion = 1. / 2.;
        };

        focus-ring = {
          width = 2;
          active.color = "#ea999c";
          inactive.color = "#c6d0f5";
        };

        border.enable = false;
        shadow.enable = false;
      };

      spawn-at-startup = [
        { argv = [ "waybar" ]; }
        { argv = [ "swww-daemon" ]; }
        {
          argv = [
            "swww"
            "img"
            (toString ./swww/bg.png)
          ];
        }
      ];

      window-rules = [
        {
          matches = [
            {
              app-id = "^org\.keepassxc\.KeePassXC$";
            }
            {
              app-id = "^org\.gnome\.World\.Secrets$";
            }
          ];
          block-out-from = "screen-capture";
        }
        {
          geometry-corner-radius = {
            bottom-left = 12.;
            bottom-right = 12.;
            top-left = 12.;
            top-right = 12.;
          };
          clip-to-geometry = true;
        }
      ];

      binds = {
        "Mod+Shift+Slash".action.show-hotkey-overlay = [ ];
        "Mod+T" = {
          hotkey-overlay.title = "Open a Terminal";
          action.spawn = "kitty";
        };
        "Mod+Space" = {
          hotkey-overlay.title = "Run fuzzel";
          action.spawn = "fuzzel";
        };
        "Super+Alt+L" = {
          hotkey-overlay.title = "Lock the screen";
          action.spawn = "swaylock";
        };

        "Mod+O" = {
          repeat = false;
          action.toggle-overview = [ ];
        };
        "Mod+Q" = {
          repeat = false;
          action.close-window = [ ];
        };

        "Mod+Left" = {
          action.focus-column-left = [ ];
        };
        "Mod+H" = {
          action.focus-column-left = [ ];
        };
        "Mod+Down" = {
          action.focus-window-down = [ ];
        };
        "Mod+J" = {
          action.focus-window-down = [ ];
        };
        "Mod+Up" = {
          action.focus-window-up = [ ];
        };
        "Mod+K" = {
          action.focus-window-up = [ ];
        };
        "Mod+Right" = {
          action.focus-column-right = [ ];
        };
        "Mod+L" = {
          action.focus-column-right = [ ];
        };

        "Mod+Ctrl+Left" = {
          action.move-column-left = [ ];
        };
        "Mod+Ctrl+H" = {
          action.move-column-left = [ ];
        };
        "Mod+Ctrl+Down" = {
          action.move-window-down = [ ];
        };
        "Mod+Ctrl+J" = {
          action.move-window-down = [ ];
        };
        "Mod+Ctrl+Up" = {
          action.move-window-up = [ ];
        };
        "Mod+Ctrl+K" = {
          action.move-window-up = [ ];
        };
        "Mod+Ctrl+Right" = {
          action.move-column-right = [ ];
        };
        "Mod+Ctrl+L" = {
          action.move-column-right = [ ];
        };

        "Mod+U" = {
          action.focus-workspace-down = [ ];
        };
        "Mod+I" = {
          action.focus-workspace-up = [ ];
        };

        "Mod+Shift+U" = {
          action.move-workspace-down = [ ];
        };
        "Mod+Shift+I" = {
          action.move-workspace-up = [ ];
        };

        "Mod+1" = {
          action.focus-workspace = 1;
        };
        "Mod+2" = {
          action.focus-workspace = 2;
        };
        "Mod+3" = {
          action.focus-workspace = 3;
        };
        "Mod+4" = {
          action.focus-workspace = 4;
        };
        "Mod+5" = {
          action.focus-workspace = 5;
        };
        "Mod+6" = {
          action.focus-workspace = 6;
        };
        "Mod+7" = {
          action.focus-workspace = 7;
        };
        "Mod+8" = {
          action.focus-workspace = 8;
        };
        "Mod+9" = {
          action.focus-workspace = 9;
        };

        "Mod+Ctrl+1" = {
          action.move-column-to-workspace = 1;
        };
        "Mod+Ctrl+2" = {
          action.move-column-to-workspace = 2;
        };
        "Mod+Ctrl+3" = {
          action.move-column-to-workspace = 3;
        };
        "Mod+Ctrl+4" = {
          action.move-column-to-workspace = 4;
        };
        "Mod+Ctrl+5" = {
          action.move-column-to-workspace = 5;
        };
        "Mod+Ctrl+6" = {
          action.move-column-to-workspace = 6;
        };
        "Mod+Ctrl+7" = {
          action.move-column-to-workspace = 7;
        };
        "Mod+Ctrl+8" = {
          action.move-column-to-workspace = 8;
        };
        "Mod+Ctrl+9" = {
          action.move-column-to-workspace = 9;
        };

        "Mod+F" = {
          action.maximize-column = [ ];
        };
        "Mod+Shift+F" = {
          action.fullscreen-window = [ ];
        };
        "Mod+C" = {
          action.center-column = [ ];
        };

        "Mod+Equal" = {
          action.set-column-width = "+10%";
        };
        "Mod+Minus" = {
          action.set-column-width = "-10%";
        };
        "Mod+V" = {
          action.toggle-window-floating = [ ];
        };
        "Mod+Shift+V" = {
          action.switch-focus-between-floating-and-tiling = [ ];
        };

        "Mod+P" = {
          action.screenshot = [ ];
        };
        "Mod+Ctrl+P" = {
          action.screenshot-screen = [ ];
        };
        "Mod+Alt+P" = {
          action.screenshot-window = [ ];
        };

        "Mod+Shift+E" = {
          action.quit = [ ];
        };
        "Ctrl+Alt+Delete" = {
          action.quit = [ ];
        };
      };
    };
  };
}
