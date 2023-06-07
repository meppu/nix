{ pkgs, ... }:

{
  users.users.meppu = {
    isNormalUser = true;
    description = "meppu";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    shell = pkgs.fish;
  };
}