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
				mappings = let 
					open_file_or_pdf = ''
		function(prompt_bufnr)
		  local actions = require("telescope.actions")
		  local action_state = require("telescope.actions.state")

		  local entry = action_state.get_selected_entry()
		  actions.close(prompt_bufnr)

		  local path = entry.path or entry.filename
		  if not path then return end

		  if path:match("%.pdf$") then
			vim.fn.jobstart({ "zathura", path }, { detach = true })
		  else
			vim.cmd("edit " .. vim.fn.fnameescape(path))
		  end
		end
					'';
				in {
					i = {
						"<CR>".__raw = open_file_or_pdf;
					};
					n = {
						"<CR>".__raw = open_file_or_pdf;
					};
				};
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
