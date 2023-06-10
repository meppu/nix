{ inputs, ... }:

{
  environment.systemPackages = with inputs; [
    devenv.packages.x86_64-linux.devenv
  ];
}