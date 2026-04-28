#https://www.lazyvim.org/keymaps#general good to take reference keybinds and avoid conflicts
{
	programs.nixvim.keymaps = [
		{
		  key = "<leader>cf";
		  action = "<cmd>lua vim.lsp.buf.format()<cr>";
		  options = {
			silent = false;
			desc = "Format buffer";
		  };
		}
		{
			mode = "n";
			key = "<leader>e";
			action = "<cmd>lua vim.diagnostic.open_float()<cr>";
			options.silent = true;
		}
		{
		  key = "<leader>df";
		  action = "<cmd>lua vim.lsp.buf.code_action()<cr>";
		  options = {
			silent = true;
			desc = "Code action";
		  };
		}
		{
		  key = "<tab>";
		  action = "<cmd>bnext<cr>";
		  options = {
			silent = true;
			desc = "Next buffer";
		  };
		}
		{
		  key = "<S-tab>";
		  action = "<cmd>bprevious<cr>";
		  options = {
			silent = true;
			desc = "Previous buffer";
		  };
		}
		{
		  mode = "v";
		  key = "<Tab>";
		  action = ">gv";
		  options = {
			desc = "Increase indent and reselect";
			silent = true;
		  };
		}
		{
		  mode = "v";
		  key = "<S-Tab>";
		  action = "<gv";
		  options = {
			desc = "Decrease indent and reselect";
			silent = true;
		  };
		}
		{
		  key = "<leader>ll";
		  action = "<cmd>VimtexView<cr>";
		  options = {
			silent = true;
			desc = "Scroll pdf viewer to current line (.tex files)";
		  };
		}
		{
			mode = "n";
			key = "do";
			action = "<cmd>diffget<cr>";
			options = {
				silent = true;
				desc = "Diff: get hunk from other window";
			};
		}
		{
			mode = "n";
			key = "dp";
			action = "<cmd>diffput<cr>";
			options = {
				silent = true;
				desc = "Diff: put hunk to other window";
			};
		}
		{
			mode = "n";
			key = "<leader>hp";
			action = "<cmd>Gitsigns preview_hunk_inline<cr>";
			options = {
				silent = true;
				desc = "Diff: put hunk to other window";
			};
		}
	];	
}
