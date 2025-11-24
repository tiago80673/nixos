{
  #treesitter is generally great for things where you need the structure of the respective programming language.
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      nixGrammars = true;
      nixvimInjections = true;
      settings = {
        auto_install = true; #this can break some stuff especially with version mismatches. adjust with extraPkgs
        indent.enable = true;
      };
      # Hide code in foldings and allow expanding
      folding = true;
    };

  };
}
