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
    ../../shared/nvidia.nix
    ../../shared/shell.nix
    ../../shared/podman.nix
    ../../shared/sound.nix
  ];

  nix = {
    gc = {
		  automatic = true;
		  dates = "weekly";
		  options = "--delete-older-than 14d";
	  };

    settings.experimental-features = [ "nix-command" "flakes" ];
  };
  
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "23.05";
}
