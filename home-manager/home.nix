{ pkgs, ...}: 

{
  imports = [
    ./git.nix
    ./gnome.nix
    ./vscode.nix
  ];

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;

  home = {
    username = "meppu";
    homeDirectory = "/home/meppu";
    stateVersion = "23.05";

    file = {
      ".ssh/allowed_signers".text = "* ${builtins.readFile /home/meppu/.ssh/id_rsa.pub}";
    };

    packages = with pkgs; [
      # Dev
      pods
      erlang elixir rustup deno nodejs_20 zig gcc13
      
      # Daily
      google-chrome-dev discord spotify authy
    ];
  };
}

