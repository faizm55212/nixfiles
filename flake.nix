{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; 
    caelestia-shell.url = "github:caelestia-dots/shell";
    mac-style-plymouth = {
      url = "github:faizm55212/mac-plymouth-theme";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [ inputs.mac-style-plymouth.overlays.default ];
    };
  in
  {
    nixosConfigurations.unknown = nixpkgs.lib.nixosSystem {
      inherit pkgs;
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/unknown/configuration.nix
        inputs.home-manager.nixosModules.default
      ];
    };
  };
}
