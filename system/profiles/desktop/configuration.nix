{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../users/meppu.nix

    ../../shared/boot.nix
    ../../shared/font.nix
    ../../shared/gnome.nix
    ../../shared/local.nix
    ../../shared/networking.nix
    ../../shared/nix.nix
    ../../shared/nvidia.nix
    ../../shared/shell.nix
    ../../shared/virtualisation.nix
    ../../shared/sound.nix
  ];

  networking.hostName = "desktop";
  system.stateVersion = "23.05";
}
