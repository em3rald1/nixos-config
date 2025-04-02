{ pkgs, ... }: {
  vim = { 
    options.tabstop = 2;
    options.shiftwidth = 2;

    theme.enable = true;
    theme.name = "base16";
    theme.base16-colors = {
      base00 = "000000";
      base01 = "121212";
      base02 = "222222";
      base03 = "333333";
      base04 = "999999";
      base05 = "c1c1c1";
      base06 = "999999";
      base07 = "c1c1c1";
      base08 = "5f8787";
      base09 = "aaaaaa";
      base0A = "8c7f70";
      base0B = "9b8d7f";
      base0C = "aaaaaa";
      base0D = "888888";
      base0E = "999999";
      base0F = "444444";
    };

    utility.motion.hop.enable = true;
    presence.neocord.enable = true;

    mini.statusline.enable = true;
    telescope.enable = true;
    filetree.neo-tree.enable = true;
    autocomplete.blink-cmp.enable = true;

    autopairs.nvim-autopairs.enable = true;

    treesitter.autotagHtml = true;

    languages = {
      enableLSP = true;
      enableTreesitter = true;

      python.enable = true;
      markdown.enable = true;
      nix.enable = true;
      nix.lsp.package = pkgs.nixd;
      nix.lsp.server = "nixd";
      ts.enable = true;
      rust.enable = true;
      zig.enable = true;
      haskell.enable = true;
      gleam.enable = true;
      php.enable = true;
      html.enable = true;
      java.enable = true;
      assembly.enable = true;
      #      assembly.treesitter.package = pkgs.vimPlugins.nvim-treesitter-parsers.asm; 
      clang.enable = true;
      csharp.enable = true;
      #      csharp.lsp.server = "omnisharp";
      #      csharp.lsp.package = pkgs.omnisharp-roslyn;
    };
  };
}
