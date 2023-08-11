{pkgs, ...}: {
  imports = [
    ./appindicator/default.nix
    ./blur-my-shell/default.nix
    # ./dash-to-panel/default.nix
    ./just-perfection/default.nix
    ./paperwm/default.nix
    ./rounded-window-corners/default.nix
  ];

  home.packages = with pkgs; [
    gnome-decoder
    gnome.gnome-tweaks
  ];

  gtk = {
    enable = true;

    theme = {
      name = "Adwaita-dark";
    };

    iconTheme = {
      name = "Adwaita";
    };
  };

  dconf.settings = {
    "org/gnome/shell".disable-extension-version-validation = true;

    "org/gnome/desktop/interface" = {
      clock-format = "24h";
      enable-hot-corners = false;
      show-battery-percentage = false;
      color-scheme = "prefer-dark";
      font-hinting = "full";
      font-antialiasing = "rgba";
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu";
      workspace-names = ["First" "Second" "Third" "Fourth"];
    };
  };
}
