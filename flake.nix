{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; 
    caelestia-shell.url = "github:faizm55212/caelestia-shell";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, caelestia-shell, ... }@inputs: {
    nixosConfigurations.unknown = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/unknown/configuration.nix
        inputs.home-manager.nixosModules.default
      ];
    };
  };
}
