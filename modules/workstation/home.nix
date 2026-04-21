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
		./hyprland
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
	home.packages = [
		inputs.nixpkgs-for-stremio.legacyPackages.${pkgs.stdenv.hostPlatform.system}.stremio
		pkgs.unstable.code-cursor
		pkgs.unstable.antigravity-fhs
	];

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
	userName = "Tiago Caixinha";
	userEmail = "tiago.caixinha@tecnico.ulisboa.pt";
    };
  }; 
}
