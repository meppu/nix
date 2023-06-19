{ ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting

      function flake-env
        cd $argv && echo "code . && exit" | nix develop --impure
      end

      function sys-up
        sudo nixos-rebuild switch --flake $argv --upgrade
      end
    '';
  };
}
