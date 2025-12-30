{pkgs, ...}: {
	programs.nixvim.plugins.vimtex = {
		enable = true;
		settings = {
			view_method = "zathura";
			compiler_method = "latexmk";
			viewer_options = [ "-sync" "-unique" ];
			quickfix_open_on_warning = 0;
		};
		texLivePackage = pkgs.texliveFull;

	};
}
