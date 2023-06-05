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
    ../../shared/shell.nix
    ../../shared/podman.nix
    ../../shared/sound.nix
    ../../shared/xorg.nix
  ];

  nix.gc = {
		automatic = true;
		dates = "weekly";
		options = "--delete-older-than 30d";
	};

  environment.systemPackages = with pkgs; [
    neofetch vim wget
  ];

  users.users.meppu = {
    isNormalUser = true;
    description = "meppu";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "23.05";
}
