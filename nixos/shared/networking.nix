{ config, pkgs, ... }: 

{
  networking = {
    hostName = "desktop";
    networkmanager.enable = true;
    nameservers = [ "1.0.0.1" "1.1.1.1" ];
  };
}