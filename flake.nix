{
  description = "Flake for meppu!";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    devenv.url = "github:cachix/devenv/v0.6.2";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, devenv, ... }@inputs: 
    let
        system = "x86_64-linux";
    in
    {

    nixosConfigurations = {
      "desktop" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs.inputs = inputs;

        modules = [
          ./system/profiles/desktop/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            
            home-manager.users.meppu = import ./home/meppu/home.nix;
          }
        ];
      };
    };
  };
}
