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


	servers = {
		bashls.enable = true;
		
		clangd = {
			enable = true;
			# TODO: one day make this work, but not here
			# cmd =[
				# "clangd"
				# "--query-driver=/nix/store/y7qcrqigrbxivnm7lzav8fqy0mx44918-xtensa-esp-elf-esp-idf-v5.5.1/bin/xtensa-esp32-elf-gcc"
				# "--extra-arg=-I${pkgs.esp-idf-full}/components/linux/include"
				# "--extra-arg=-I${pkgs.esp-idf-full}/components/newlib/platform_include"
			# ];
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
