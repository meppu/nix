{ config, pkgs, ... }:

{
  users.users.meppu.shell = pkgs.fish;

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
  };
}