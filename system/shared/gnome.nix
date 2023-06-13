{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    layout = "tr";
    xkbVariant = "";

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
