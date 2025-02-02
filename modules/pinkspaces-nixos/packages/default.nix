{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ripgrep ffmpeg fzf htop gnupg bat unzip imagemagick libnotify
    mpv grim slurp wl-clipboard fastfetch bitwarden dunst prismlauncher qutebrowser
    rofi-wayland telegram-desktop waybar playerctl vesktop obs-studio
  ];
}
