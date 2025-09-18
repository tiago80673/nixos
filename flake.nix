{
  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    flake-programs-sqlite = {
      # command-not-found
      url = "github:wamserma/flake-programs-sqlite";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
   nixvim = {
      url = "github:nix-community/nixvim/nixos-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
	  nixpkgs-unstable,
	  nur,
      ...
    }:
    let
        nixpkgsConfig = {
            allowUnfree = true;
        };

	desktopModules = [
	inputs.home-manager.nixosModules.home-manager
	{
		home-manager.useGlobalPkgs = true;
		home-manager.useUserPackages = true;
	}
	];


  overlay-unstable = final: prev: {
    unstable = import nixpkgs-unstable {
      inherit (final) system;
      config.allowUnfree = true;
    };
  };

	overlay-myPkgs = final: prev: let
	  dirs = builtins.attrNames (builtins.readDir "${self}/pkgs");
	in
	  builtins.listToAttrs (map (name: {
		name = name;
		value = final.callPackage (self + "/pkgs/${name}") {};
	  }) dirs);

	system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };


    in
    {
	  #expose custom pkgs in /pkgs as outputs
	  packages.${system} = import ./pkgs { inherit pkgs; };

      nixosConfigurations.piupiu = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          inputs.flake-programs-sqlite.nixosModules.programs-sqlite
		  # Adds the NUR overlay
		  nur.modules.nixos.default
          ({ config, pkgs, ... }: {
            nixpkgs = {
				config = nixpkgsConfig;
				overlays = [ 
					overlay-unstable 
					overlay-myPkgs
							];
			};
          })
        ] ++ desktopModules;
      };
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
    };
}
