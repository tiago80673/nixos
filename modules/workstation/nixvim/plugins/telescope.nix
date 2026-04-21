{
	#Finder
	programs.nixvim.plugins.telescope = {
		enable = true;
		extensions.file-browser = {
			enable = true; # "<leader>fe"
			settings = {
				hidden = true;
				respect_gitignore = false;
			};
		};
		settings = {
			pickers = {
				find_files = {
					hidden = true;
				};
			};
			defaults = {
				file_ignore_patterns = [
					"^.git/"
				];
			};
		};
		keymaps = {
			"<leader>ff" = {
				action = "find_files";
			};
			"<leader>fg" = {
				action = "live_grep";
			};
			"<leader>fe" = {
				action = "file_browser";
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
			"<leader>fw" = {
				action = "grep_string";
			};

		};
	};
}
