# My Nix Config

This repository is for storing my nix configurations. Now with flakes!

```bash
nix flake show github:meppu/nix-config
```

Then select a profile and rebuild. an example for `desktop`:

```bash
nixos-rebuild switch --flake github:meppu/nix-config#desktop
```
