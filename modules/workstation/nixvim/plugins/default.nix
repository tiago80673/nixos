{
    imports = [
	./lint.nix	
	./lsp.nix
	./treesitter.nix
	./wilder.nix
    ];

    programs.nixvim.plugins = {

		# Status bar on the bottom
		lualine.enable = true;

		# Persist cursor position
		lastplace.enable = true;
	
		# Auto add closing brackets, parentheses, etc.
		nvim-autopairs = {
			enable = true;
			settings = {
				#check_ts = true;
			};
		};

		# Undo tree
		undotree = {
			enable = true;
		};

        # Add open files at the top
        bufferline.enable = true;

		# Dependency of various plugins 
		web-devicons.enable = true;

		# Highlight words and lines on the cursor
		cursorline = {
			enable = true;
			cursorline.number = true;
		};
		
		# Bracket pairs alternating colors
		rainbow-delimiters.enable = true;
		
		# Easy commenting
		comment.enable = true;

		# Auto complete / function suggestions
		cmp = {
			enable = true; 
			autoEnableSources = true;
			settings.sources = [
				{ name = "nvim_lsp"; }
				{ name = "path"; }
				{ name = "buffer"; }
			];
			settings.snippet = {
				expand = "function(args) require('luasnip').lsp_expand(args.body) end";
			};
			settings.mapping = {
				"<C-Space>" = ''
				cmp.mapping(function(fallback)
				  if cmp.visible() then
					cmp.mapping.complete({})
				  elseif require('luasnip').locally_jumpable(-1) then
					require('luasnip').expand_or_jump()
				  else
					fallback()
				  end
				end, { 'i', 's' })
			  '';
				"<Tab>" = ''
				cmp.mapping(function(fallback)
				  if cmp.visible() then
					cmp.select_next_item()
				  else
					fallback()
				  end
				end, { 'i', 's' })
				'';
			  "<S-Tab>" = ''
				cmp.mapping(function(fallback)
				  if cmp.visible() then
					cmp.select_prev_item()
				  else
					fallback()
				  end
				end, { 'i', 's' })
			  '';
			};
		};

		# Snippets
		# Seems that cmp need this
		luasnip = {
		  enable = true;
		  settings = {
			enable_autosnippets = true;
			store_selection_keys = "<Tab>";
		  };
		};
		#auto-save.enable = true;

		# Colored side bar for new/modified code 
		gitsigns = {
		  enable = true;
		  settings.current_line_blame = true; # In-line git blame
		};

		# Git commands as vim commands	
		fugitive.enable = true;

		which-key.enable = true;
		which-key.settings = {
			delay = 1000;
		};


		#Fully featured file explorer.
        chadtree.enable = true;

		#Finder
		telescope.enable = true;
		telescope.keymaps = {
			"<leader>ff" = {
			  action = "find_files";
			};
			"<leader>fg" = {
			  action = "live_grep";
			};
			"<leader>fb" = {
			  action = "buffers";
			};
			"<leader>fh" = {
			  action = "help_tags";
			};
			"<leader>fc" = {
			  action = "commands";
			};
			"<leader>fq" = {
			  action = "quickfix";
			};
			"<leader>fk" = {
			  action = "keymaps";
			};
			"<leader>fr" = {
			  action = "lsp_references";
			};
			"<leader>fds" = {
			  action = "lsp_document_symbols";
			};
			"<leader>fs" = {
			  action = "lsp_workspace_symbols";
			};
			"<leader>fp" = {
			  action = "diagnostics";
			};
			"<leader>fi" = {
			  action = "lsp_implementations";
			};
			"<leader>fd" = {
			  action = "lsp_definitions";
			};
			"<leader>ft" = {
			  action = "lsp_type_definitions";
			};
			"<leader>fa" = {
			  action = "builtin";
			};
			"<leader>f;" = {
			  action = "resume";
			};
		};

	};

}
