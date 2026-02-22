{ inputs, pkgs, ... }:
{
  xdg.desktopEntries = {
    "browser" = {
      name = "Vivaldi";
      exec = "${pkgs.vivaldi}/bin/vivaldi";
    };
    "file-manager" = {
      name = "Nautilus";
      exec = "${pkgs.nautilus}/bin/nautilus";
    };
    "amongus" = {
      name= "Among Us";
      exec = "env LUTRIS_SKIP_INIT=1 lutris lutris:rungameid/5";
    };
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "browser.desktop";
      "application/pdf" = "browser.desktop";
      "x-scheme-handler/http" = "browser.desktop";
      "x-scheme-handler/https" = "browser.desktop";
      "x-scheme-handler/tg" = "org.telegram.desktop.desktop";
      "x-scheme-handler/tonsite" = "org.telegram.desktop.desktop";
      "x-scheme-handler/discord" = "vesktop.desktop";
      "inode/directory" = "file-manager.desktop";
      "application/x-gnome-saved-search" = "file-manager.desktop";
      "x-scheme-handler/amongus" = "amongus.desktop";
    };
  };
}
