{pkgs, ...}: let
  paper-wm-css = builtins.readFile ./user.css;
in {
  home = {
    packages = [pkgs.gnomeExtensions.paperwm];
    file.".config/paperwm/user.css".text = paper-wm-css;
  };

  dconf.settings = {
    "org/gnome/shell".enabled-extensions = [
      "paperwm@hedning:matrix.org"
    ];

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
  };
}
