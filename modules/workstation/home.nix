{
  inputs, 
  pkgs,
  ...
}:
{
  home-manager.backupFileExtension = "hm-backup";
  home-manager.users.tiagoc = {config, ...}: {
    imports = [
        inputs.nixvim.homeModules.nixvim # just importing my nixvim flake input to my home-manager
        ./nixvim
		./firefox.nix
		./ncspot.nix
		./gnome.nix
		./shell/zsh.nix
    ];

	programs.direnv = {
			enable = true;
			nix-direnv.enable = true;
			# silent = true;
			config = {
				global = {
					# trying to disable prints, seems broken
					log_filter="^$";
					log_format = "-";
					hide_env_diff = true;
				};
			};
		};

    home.file."/home/tiagoc/.configA" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home"; 
      target = "/home/tiagoc/.configA";
    };
	home.file.".config/nixpkgs" = {
		# source = "${config.home.homeDirectory}/nixos/dots/nixpkgs"; #better but idk why not working
		source = ../../dots/.config/nixpkgs;
		recursive = true;
	};
    home.stateVersion = "24.11";
    nix.registry = {
    	nixpkgs.flake = inputs.nixpkgs;
		n.flake = inputs.nixpkgs; # alias for doing n#... instead of nixpkgs#...
    };
    programs.git = {
	enable = true;
	settings.user = {
	name = "Tiago Caixinha";
	email = "tiago.caixinha@tecnico.ulisboa.pt";
			};
    };
  }; 
}
