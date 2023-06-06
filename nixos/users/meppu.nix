{ pkgs, config, ... }:

{
  users.users.meppu = {
    isNormalUser = true;
    description = "meppu";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };
}