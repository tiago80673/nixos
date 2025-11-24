# nixvim configuration based on Pesteves2002
# https://github.com/Pesteves2002/dotfiles/tree/b8f53d5a48af3328d3be53dc20eae61a78d3fcf1/home/tomas/features/tools/nixvim

{pkgs,...}: {
  imports = [
#    ./commands.nix
    ./options.nix
    ./clipboard.nix
    ./colorscheme.nix
    ./keymaps.nix
    ./plugins
  ];

	home.packages = with pkgs; [
		zathura #latex
		texliveFull #latex
	];
  programs.nixvim = {
    enable = true;
    enableMan = true;

    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    globals.mapleader = " ";

    extraConfigVim = ''
          set tabstop=4
          set softtabstop=4
          set shiftwidth=4
    '';
	extraPackages = with pkgs; [
		#.tex files need this in order to treesitter to work
		unstable.tree-sitter
		nodejs_22
	];
  };

# home.sessionVariables = {
#   EDITOR = "nvim";
# };

  systemd.user.sessionVariables = {
    EDITOR = "nvim";
  };
}
