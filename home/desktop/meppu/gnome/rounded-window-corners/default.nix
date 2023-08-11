{
  lib,
  pkgs,
  ...
}: let
  rounded-corners-settings = builtins.readFile ./settings.conf;
in {
  home.packages = [pkgs.gnomeExtensions.rounded-window-corners];

  dconf.settings = {
    "org/gnome/shell".enabled-extensions = [
      "rounded-window-corners@yilozt"
    ];

    "org/gnome/shell/extensions/rounded-window-corners" = with lib.hm.gvariant; {
      skip-libadwaita-app = false;

      global-rounded-corner-settings = rounded-corners-settings;
      border-color = mkTuple [0.478 0.478 0.478 0.4];

      border-width = 1;
      settings-version = mkUint32 5;
    };
  };
}
