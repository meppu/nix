{ pkgs, config, ... }:

{
  services.xserver = {
    enable = true;
    layout = "tr";
    xkbVariant = "";
  };
}