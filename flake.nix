{
  description = "Flake for meppu!";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  }: let
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      "desktop" = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          ./system/profiles/desktop/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.meppu = import ./home/desktop/meppu/home.nix;
          }
        ];
      };
    };

    templates = {
      elixir = {
        path = ./templates/elixir;
        description = "Starter template for Elixir with Mix";
      };

      erlang = {
        path = ./templates/erlang;
        description = "Starter template for Erlang with Rebar3 and ErlangLS";
      };
    };
  };
}
