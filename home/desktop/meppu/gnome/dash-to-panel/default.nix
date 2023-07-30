{ pkgs, ... }:

let
  panel-positions = builtins.readFile ./positions.json;
in
{
  home.packages = [ pkgs.gnomeExtensions.dash-to-panel ];

  dconf.settings = {
    "org/gnome/shell".enabled-extensions = [
      "dash-to-panel@jderose9.github.com"
    ];

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
  };
}
