{lib, ...}:
let
	disableInFirenvim = {
		luaConfig.pre = lib.mkBefore ''
	  if not vim.g.started_by_firenvim then
	  '';

		luaConfig.post = lib.mkAfter ''
	  end
	  '';
	};
in
	{
	programs.nixvim.plugins.bufferline = disableInFirenvim;
	programs.nixvim.plugins.wilder = disableInFirenvim;

	programs.nixvim.plugins.firenvim = {
		enable = true;
		settings.localSettings = {
			".*" = {
				cmdline = "neovim";
				content = "text";
				priority = 0;
				selector = "textarea";
				takeover = "never";
			};
		};
		luaConfig.post = ''
			-- special lua config for vim inside browser
			if vim.g.started_by_firenvim == true then
				vim.cmd("colorscheme default")

				-- Don't show statusline/cmdline clutter in the small textarea
				vim.opt.laststatus = 0
			end
			'';
	};
}
