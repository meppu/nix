{
  description = "Write description here";
  nixConfig.bash-prompt = "\\[\\e[31m\\]\\[\\e[0;31m\\](\\[\\e[1;32m\\]\\u \\[\\e[0;30m\\]in \\[\\e[1;31m\\]erlang \\[\\e[0;30m\\]at \\[\\e[1;34m\\]\\W\\[\\e[0;31m\\])\\[\\e[0m\\] % ";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
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
