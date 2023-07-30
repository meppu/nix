{ pkgs, ... }:

let
  gnome-packages = with pkgs; [
    gnome-decoder
    gnome.gnome-tweaks
    gnomeExtensions.appindicator
    gnomeExtensions.just-perfection
    gnomeExtensions.dash-to-panel
    gnomeExtensions.paperwm
  ];

  gtk-theme = {
    name = "Adwaita-dark";
  };

  icon-theme = {
    name = "Adwaita";
  };

  panel-positions = builtins.readFile ./panel-positions.json;
in
{
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
        "dash-to-panel@jderose9.github.com"
        "paperwm@hedning:matrix.org"
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
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      search = [ "<Shift><Super>s" ];
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
      showdesktop-button-width = 10;

      dot-position = "LEFT";
      dot-style-focused = "DOTS";
      dot-style-unfocused = "DOTS";

      panel-element-positions = panel-positions;
    };

    "org/gnome/shell/extensions/paperwm" = {
      window-gap = 20;
      horizontal-margin = 20;
      vertical-margin = 20;
      vertical-margin-bottom = 20;

      override-hot-corner = true;
      show-window-position-bar = false;
      use-default-background = true;

      workspace-names = [ "First" "Second" "Third" "Slave"  ];
    };
  };
}
