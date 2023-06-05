{ pkgs, config, ... }:

{
  services.xserver = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  environment.gnome.excludePackages = with pkgs.gnome; [
    epiphany
    geary
    seahorse
    cheese
  ];
}