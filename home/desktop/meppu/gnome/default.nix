{ lib, pkgs, ... }:

let
  gnome-packages = with pkgs; [
    gnome-decoder
    gnome.gnome-tweaks
    gnomeExtensions.appindicator
    gnomeExtensions.just-perfection
    gnomeExtensions.dash-to-panel
    gnomeExtensions.paperwm
    gnomeExtensions.blur-my-shell
    gnomeExtensions.rounded-window-corners
  ];

  gtk-theme = {
    name = "Adwaita-dark";
  };

  icon-theme = {
    name = "Adwaita";
  };

  panel-positions = builtins.readFile ./panel-positions.json;
  paper-wm-css = builtins.readFile ./paper-wm.css;
  rounded-corners-settings = builtins.readFile ./rounded-corners.conf;
in
{
  home.file.".config/paperwm/user.css".text = paper-wm-css;

  home.packages = gnome-packages;

  gtk = {
    enable = true;

    theme = gtk-theme;
    iconTheme = icon-theme;
  };

  dconf.settings = {
    "org/gnome/shell" = {
      disable-extension-version-validation = true;
      
      enabled-extensions = [
        "appindicatorsupport@rgcjonas.gmail.com"
        "just-perfection-desktop@just-perfection"
        # "dash-to-panel@jderose9.github.com"
        "paperwm@hedning:matrix.org"
        "blur-my-shell@aunetx"
        "rounded-window-corners@yilozt"
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

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
    };

    "org/gnome/desktop/wm/preferences" = { 
      button-layout = "appmenu";
      workspace-names = [ "First" "Second" "Third" "Slave"  ];
    };

    "org/gnome/shell/extensions/appindicator" = {
      tray-pos = "right";
    };

    "org/gnome/shell/extensions/just-perfection" = {
      activities-button = false;
      hot-corner = false;
      app-menu = false;

      panel-size = 32;
    };

    "org/gnome/shell/extensions/dash-to-panel" = {
      panel-position = "LEFT";
      stockgs-keep-top-panel = true;
      animate-appicon-hover = true;

      appicon-margin = 0;
      appicon-padding = 8;
      show-apps-icon-side-padding = 0;
      showdesktop-button-width = 10;

      dot-position = "LEFT";
      dot-style-focused = "DOTS";
      dot-style-unfocused = "DOTS";

      panel-element-positions = panel-positions;
    };

    "org/gnome/shell/extensions/paperwm" = {
      window-gap = 12;
      horizontal-margin = 12;
      vertical-margin = 12;
      vertical-margin-bottom = 12;

      override-hot-corner = true;
      show-window-position-bar = false;
      use-default-background = true;
      show-workspace-indicator = false;
    };

    "org/gnome/shell/extensions/rounded-window-corners" = with lib.hm.gvariant; {
      skip-libadwaita-app = false;

      global-rounded-corner-settings = rounded-corners-settings;
      border-color = mkTuple [ 0.478 0.478 0.478 0.4 ];

      border-width = 1;
      settings-version = mkUint32 5;
    };
  };
}
