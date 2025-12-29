{
	pkgs,
	config,
	...
}: {

	programs.nixvim.plugins.lsp = {
		enable = true;
	
	    keymaps = {
	      silent = true;

	      diagnostic = {
		"<C-p>" = "goto_prev";
		"<C-ç>" = "goto_next";
		"<leader>e" = "open_float";
	      };

	      lspBuf = {
		gd = "definition";
		gr = "references";
		gt = "type_definition";
		gi = "implementation";
		K = "hover";
		rn = "rename";
	      };
	    };

		# decide which clangd engine to use from CLANGD_BIN
		# allows to change which clangd nvim uses to match the current c/cpp environment
		# I think either lsp.nvim or nixvim should retrieve this from which clangd resolves first in PATH instead of this hack
		# should it be on luaConfig.post?
		# prints on_attach / on every new buffer, feels like too much
		luaConfig.post = ''
  local clangd = vim.env.CLANGD_BIN

  if not clangd or clangd == "" then
	  vim.notify("CLANGD_BIN not set; using default clangd", vim.log.levels.WARN)
  else
	  vim.lsp.config["clangd"] = {
		  cmd = { clangd, "--background-index" },
		  on_attach = function(_, _)
			  vim.notify("clangd attached: " .. clangd)
		  end,
	  }
  end
  '';

	servers = {
		bashls.enable = true;
		
		clangd = {
			enable = true;
		};

		texlab.enable = true; #latex

		
		pyright.enable = true;

		nil_ls.enable = true; # Nix
#		nil_ls = {
			#enable = true;
#			settings.formatting.command = ["alejandra"];
#			};

		};
	};
}
