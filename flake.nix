{
  description = "Flake for meppu!";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: 
    let
      system = "x86_64-linux";
    in
    {

    nixosConfigurations = {
      "desktop" = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          ./system/profiles/desktop/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            
            home-manager.users.meppu = import  ./home/desktop/meppu/home.nix;
          }
        ];
      };
    };
  };
}
