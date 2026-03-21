{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      # dynamic_background_opacity = true;
      enable_audio_bell = false;
      window_padding_width = 4;
      # background_opacity = 0.9;
      # background_blur = 5;
      font_family = "FiraCode Nerd Font Mono";
      # 0: "#000000"
      # 1: "#1d0a2b"
      # 2: "#381652"
      # 3: "#512376"
      # 4: "#693295"
      # 5: "#8042b0"
      # 6: "#9553c8"
      # 7: "#a867dc"
      # 8: "#78251d"
      # 9: "#553d00"
      # 10: "#255500"
      # 11: "#035f28"
      # 12: "#03555d"
      # 13: "#253d80"
      # 14: "#55257b"
      # 15: "#781c52"

      foreground   = "#a39a90";
      background   = "#16130f";
      cursor       = "#a39a90";
      # black                
      color0       = "#16130f";
      color8       = "#5a5047";
      # red                  
      color1       = "#826d57";
      color9       = "#826d57";
      # green                
      color2       = "#57826d";
      color10      = "#57826d";
      # yellow               
      color3       = "#6d8257";
      color11      = "#6d8257";
      # blue                 
      color4       = "#6d5782";
      color12      = "#6d5782";
      # magenta              
      color5       = "#82576d";
      color13      = "#82576d";
      # cyan                 
      color6       = "#576d82";
      color14      = "#576d82";
      # white                
      color7       = "#a39a90";
      color15      = "#dbd6d1";
    };
  };
}
