{
  #treesitter is generally great for things where you need the structure of the respective programming language.
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      nixGrammars = true;
      nixvimInjections = true;
      settings = {
        auto_install = true;
        indent.enable = true;
      };
      # Hide code in foldings and allow expanding
      folding = true;
    };

    # treesitter-context.enable = true;
  };
}
