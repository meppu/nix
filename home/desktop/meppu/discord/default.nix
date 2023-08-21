{pkgs, ...}: let
  settings = builtins.toJSON {
    "IS_MAXIMIZED" = true;
    "IS_MINIMIZED" = false;
    "SKIP_HOST_UPDATE" = true;
  };
in {
  home.packages = [
    (pkgs.discord.override {
      withVencord = true;
    })
  ];
  
  home.file.".config/discord/settings.json".text = settings;
}
