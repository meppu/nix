{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gnome.gnome-tweaks
    gnomeExtensions.appindicator
    gnomeExtensions.just-perfection
    gnomeExtensions.dash-to-panel
  ];

  gtk = {
    enable = true;
    theme.name = "Adwaita-dark";

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  dconf.settings = {
    "org/gnome/shell" = {
      disable-extension-version-validation = true;
      
      enabled-extensions = [
        "appindicatorsupport@rgcjonas.gmail.com"
        "just-perfection-desktop@just-perfection"
        "dash-to-panel@jderose9.github.com"
      ];
    };

    "org/gnome/desktop/interface" = {
      clock-format = "24h";
      enable-hot-corners = false;
      show-battery-percentage = false;
      color-scheme = "prefer-dark";
      font-hinting = "full";
      font-antialiasing = "rgba";
    };

    "org/gnome/desktop/wm/preferences" = { 
      button-layout = "appmenu:minimize,maximize,close";
    };
    
    "org/gnome/shell/extensions/appindicator" = {
      tray-pos = "right";
    };

    "org/gnome/shell/extensions/just-perfection" = {
      activities-button = false;
      hot-corner = false;
      panel-size = 32;
    };

    "org/gnome/shell/extensions/dash-to-panel" = {
      panel-position = "LEFT";
      stockgs-keep-top-panel = true;
      animate-appicon-hover = true;

      appicon-margin = 0;
      appicon-padding = 8;
      show-apps-icon-side-padding = 0;

      trans-use-dynamic-opacity = true;
      trans-panel-opacity = 0.8;

      dot-position = "LEFT";
      dot-style-focused = "DOTS";
      dot-style-unfocused = "DOTS";

      panel-element-positions = (builtins.readFile "/home/meppu/nix-config/external/panel/positions.json");
    };
  };
}