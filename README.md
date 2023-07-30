# My Nix Config

This repository is for storing my nix configurations. Now with flakes!

```bash
nix flake show github:meppu/nix-config
```

Then select a profile and rebuild. an example for `desktop`:

```bash
sudo nixos-rebuild switch --flake github:meppu/nix-config#desktop
```

## Wallpapers

I made my own nix wallpapers. Do whatever you want with these :)

![dark](/home/desktop/meppu/wallpapers/nixos-liquid-dark.png)

![light](/home/desktop/meppu/wallpapers/nixos-liquid-light.png)
