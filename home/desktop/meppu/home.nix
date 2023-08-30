{pkgs, ...}: {
  imports = [
    ./discord/default.nix
    ./git/default.nix
    ./gnome/default.nix
    ./vscode/default.nix
    ./wallpapers/default.nix
  ];

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;

  home = {
    username = "meppu";
    homeDirectory = "/home/meppu";
    stateVersion = "23.05";

    packages = with pkgs; [
      # nix
      alejandra
      nil
      # encryption
      cryptsetup
      # development
      podman-tui
      # daily
      authy
      element-desktop
      google-chrome
      protonvpn-gui
      spotify
    ];
  };
}
