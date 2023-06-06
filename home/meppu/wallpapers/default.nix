{ ... }:

{
  dconf.settings."org/gnome/desktop/background" = {
    picture-uri = "file://" + ./nixos-liquid-light.png;
    picture-uri-dark = "file://" + ./nixos-liquid-dark.png;
  };
}