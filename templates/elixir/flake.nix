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
        elixir = pkgs.beam.packages.erlangR25.elixir_1_15;
      in {
        devShell = pkgs.mkShell {
          packages =
            [elixir]
            ++ pkgs.lib.optionals pkgs.stdenv.isLinux (with pkgs; [
              libnotify
              inotify-tools
            ])
            ++ pkgs.lib.optionals pkgs.stdenv.isDarwin ((with pkgs.darwin.apple_sdk.frameworks; [
                CoreFoundation
                CoreServices
              ])
              ++ pkgs.terminal-notifier);
        };
      }
    );
}
