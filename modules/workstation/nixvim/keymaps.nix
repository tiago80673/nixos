{
	programs.nixvim.keymaps = [
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
	];	
}
