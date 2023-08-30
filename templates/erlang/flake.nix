{
  description = "Write description here";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
        erlang = pkgs.beam.packages.erlangR25;
      in {
        devShell = pkgs.mkShell {
          packages = [
            erlang.erlang
            erlang.erlang-ls
            erlang.rebar3
          ];
        };
      }
    );
}
