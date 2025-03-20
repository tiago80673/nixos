{
  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    flake-programs-sqlite = {
      # command-not-found
      url = "github:wamserma/flake-programs-sqlite";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        utils.follows = "flake-utils";
      };
    };
  };

  outputs = inputs@{
      self,
      nixpkgs,
      ...
    }: {
    nixosConfigurations.piupiu = nixpkgs.lib.nixosSystem {
	modules = [ ./configuration.nix
inputs.flake-programs-sqlite.nixosModules.programs-sqlite
 ];
       specialArgs = { inherit inputs; };
   };
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
}
