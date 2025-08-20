{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    # use "nixos", or your hostname as the name of the configuration
    # it's a better practice than "default" shown in the video
    nixosConfigurations.unknown = nixpkgs.lib.nixosSystem {
      #  system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/unknown/configuration.nix
        inputs.home-manager.nixosModules.default
      ];
    };
  };
}
