{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      dynamic_background_opacity = true;
      enable_audio_bell = false;
      window_padding_width = 5;
      background_opacity = 0.9;
      background_blur = 5;
    };
  };
}
