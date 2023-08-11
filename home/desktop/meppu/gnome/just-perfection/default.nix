{pkgs, ...}: {
  home.packages = [pkgs.gnomeExtensions.just-perfection];

  dconf.settings = {
    "org/gnome/shell".enabled-extensions = [
      "just-perfection-desktop@just-perfection"
    ];

    "org/gnome/shell/extensions/just-perfection" = {
      activities-button = false;
      hot-corner = false;
      app-menu = false;

      panel-size = 32;
    };
  };
}
