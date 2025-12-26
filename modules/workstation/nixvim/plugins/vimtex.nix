{pkgs, ...}: {
	programs.nixvim.plugins.vimtex = {
		enable = true;
		settings = {
			view_method = "zathura";
			compiler_method = "latexmk";
			viewer_options = [ "-sync" "-unique" ];
		};
		texLivePackage = pkgs.texliveFull;

	};
}
