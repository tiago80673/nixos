{
  #treesitter is generally great for things where you need the structure of the respective programming language.
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      nixGrammars = true;
      nixvimInjections = true;
      settings = {
		highlight.enable = true;
        indent.enable = true;
		highlight.disable = [ "latex" ];
      };
      # Hide code in foldings and allow expanding
      folding.enable = true;
    };

  };
}
