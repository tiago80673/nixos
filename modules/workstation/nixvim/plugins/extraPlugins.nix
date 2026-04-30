{pkgs, lib, ...}:
let
	enableGitLink = false; # using gitlinker
in
{
	programs.nixvim.extraPlugins = lib.optionals enableGitLink [
		(pkgs.vimUtils.buildVimPlugin {
			pname = "git-link-nvim";
			version = "unstable-jan-2026-commit";

			src = pkgs.fetchFromGitHub {
				owner = "juacker";
				repo = "git-link.nvim";
				rev = "0a56c23821fbace9a8ceeec438d04ed73287872f";
				sha256 = "sha256-3854LyGVl7JRJq7IwAgyr29yuMSabRVaWWPGbUWqq70=";
			};
		})
	];
	programs.nixvim.extraConfigLua = lib.optionalString enableGitLink ''
      local gitlink = require("git-link")

	  gitlink.setup()
      vim.keymap.set("v", "<leader>gr", function()
        gitlink.copy_line_url()
      end, { silent = true })
    '';
}
