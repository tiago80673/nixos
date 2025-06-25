{
  inputs, 
  pkgs,
  ...
}:
{
  home-manager.backupFileExtension = "hm-backup";
  home-manager.users.tiagoc = {config, ...}: {
    imports = [
        inputs.nixvim.homeManagerModules.nixvim # just importing my nixvim flake input to my home-manager
        ./nixvim
		./firefox.nix
		./ncspot.nix
		./gnome.nix
    ];

    home.file."/home/tiagoc/.configA" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home"; 
      target = "/home/tiagoc/.configA";
    };
    home.stateVersion = "24.11";
    nix.registry = {
    	nixpkgs.flake = inputs.nixpkgs;
    };
    programs.git = {
	enable = true;
	userEmail = "tiago.caixinha@tecnico.ulisboa.pt";
	userName = "Tiago Caixinha";
    };
  }; 
}
