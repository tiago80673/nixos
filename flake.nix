{
  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
   nixvim = {
      url = "github:nix-community/nixvim";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
	esp-dev = {
	  url = "github:mirrexagon/nixpkgs-esp-dev";
      inputs.nixpkgs.follows = "nixpkgs";
	};
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
	# qt5 has been flagged as unmaintained and insecure, so we must explicitly
    # permit its usage to run Stremio. However, since insecure packages are not
    # built by Hydra once marked with known vulnerabilities, we use a pinned,
    # older nixpkgs revision from before that change. This ensures Hydra can
    # provide prebuilt binaries, since building qt5 locally is too heavy.
    nixpkgs-for-stremio.url = "nixpkgs/release-24.11";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
	  nixpkgs-unstable,
	  nur,
	  esp-dev,
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
	overlay-esp-dev = (import "${inputs.esp-dev}/overlay.nix");

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
		  # Adds the NUR overlay
		  nur.modules.nixos.default
          ({ config, pkgs, ... }: {
            nixpkgs = {
				config = nixpkgsConfig;
				overlays = [ 
					overlay-unstable 
					overlay-myPkgs
					overlay-esp-dev
							];
			};
          })
        ] ++ desktopModules;
      };
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
    };
}
