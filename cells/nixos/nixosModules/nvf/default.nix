{
  config,
  pkgs,
  lib,
  inputs,
  cell,
  ...
}:
let
  cfg = config.modules.nvf;
in
{
  imports = [ inputs.nvf.nixosModules.default ];
  options.modules.nvf = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enables nvim infused with power of NVF";
    };
  };

  config = {
    environment.sessionVariables = {
      EDITOR = "nvim";
    };
    environment.systemPackages = [
      (builtins.elemAt (pkgs.callPackage cell.nixosModules.urcl-lsp { }).imports 0)
      (builtins.elemAt (pkgs.callPackage cell.nixosModules.urcl-ld { }).imports 0)
    ];
    programs.nvf = {
      enable = true;
      settings = {
        vim = {
          luaConfigPre = ''
            vim.filetype.add({
              extension = {
                urcl = "urcl",
              },
            })
          '';
          options.tabstop = 2;
          options.shiftwidth = 2;
          options.signcolumn = "no";
          theme = {
            enable = true;
            name = "base16";
            base16-colors = {
              base00 = "#16130f";
              base01 = "#2c2620";
              base02 = "#433b32";
              base03 = "#5a5047";
              base04 = "#8a8075";
              base05 = "#a39a90";
              base06 = "#beb6ae";
              base07 = "#dbd6d1";
              base08 = "#826d57";
              base09 = "#828257";
              base0A = "#6d8257";
              base0B = "#57826d";
              base0C = "#576d82";
              base0D = "#6d5782";
              base0E = "#82576d";
              base0F = "#825757";
            };
            # style = "frappe";
            # accent = "maroon";
            transparent = true;
          };
          lsp.enable = true;
          
          utility.surround.enable = true;
          
          telescope = {
            enable = true;
            setupOpts = {
              defaults.prompt_prefix = " λ ";
              pickers.find_files.find_command = [
                "${pkgs.fd}/bin/fd"
                "--type=file"
                "--follow"
              ];
            };
          };

          utility.yazi-nvim.enable = true;
          utility.yazi-nvim.setupOpts.open_for_directories = true;
          # autocomplete.blink-cmp.enable = true;
          autocomplete.nvim-cmp.enable = true;
          autopairs.nvim-autopairs.enable = true;

          treesitter.autotagHtml = true;

          lsp.servers = {
            urcl = {
              enable = true;
              filetypes = [ "urcl" ];
              cmd = [ "urcl-lsp" "--no-escape" ];
              root_markers = [ ".git" ];
            };
          };

          languages = {
            python.enable = true;
            markdown.enable = true;
            nix.enable = true;
            ts.enable = true;
            rust.enable = true;
            zig.enable = true;
            odin.enable = true;
            php.enable = true;
            html.enable = true;
            java.enable = true;
            clang.enable = true;
            typst.enable = true;
            typst.extensions.typst-preview-nvim.enable = true;
            csharp.enable = true;
          };
        };
      };
    };
  };
}
