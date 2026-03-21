{ pkgs, ... }: 
{
  services.searx = {
    enable = true;
    redisCreateLocally = true;
    settings = {
      general = {
        debug = false;
        donation_url = false;
        contact_url = false;
        privacypolicy_url = false;
        enable_metrics = false;
      };

      ui = {
        default_locale = "en";
        query_in_title = true;
        infinite_scroll = false;
        center_alignment = true;
        search_on_category_select = false;
        hotkeys = "vim";
      };

      search = {
        autocomplete = "duckduckgo";
      };

      server = {
        port = 8001;
        bind_address = "127.0.0.1";
        secret_key = "testkey12341234";
        image_proxy = true;
        public_instance = true;
        method = "GET";
      };

      # enabled_plugins = [
      #   "Basic Calculator"
      #   "Hash plugin"
      #   "Tracker URL remover"
      # ];
    };
  };

  vhosts.searx = {
    address = "127.0.0.1";
    port = 8001;
  };
}
