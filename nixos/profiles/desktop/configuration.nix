{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../shared/boot.nix
    ../../shared/font.nix
    ../../shared/gnome.nix
    ../../shared/local.nix
    ../../shared/networking.nix
    ../../shared/nvidia.nix
    ../../shared/podman.nix
    ../../shared/sound.nix
    ../../shared/xorg.nix
  ];

  nixpkgs.config.allowUnfree = true;

  users.users.meppu = {
    isNormalUser = true;
    description = "meppu";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  environment.systemPackages = with pkgs; [
    neofetch vim wget
  ];

  system.stateVersion = "23.05";
}
