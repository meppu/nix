{
  description = "Write description here";
  nixConfig.bash-prompt = "\\[\\e[31m\\]\\[\\e[0;31m\\](\\[\\e[1;32m\\]\\u \\[\\e[0;30m\\]in \\[\\e[1;35m\\]elixir \\[\\e[0;30m\\]at \\[\\e[1;34m\\]\\W\\[\\e[0;31m\\])\\[\\e[0m\\] % ";

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
