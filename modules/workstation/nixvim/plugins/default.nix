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
	};

}
