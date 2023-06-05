# My Nix Config

This repository is for storing my nix configurations. Currently stores my home and desktop configuration.

## Link.sh

This shell script is for linking this configuration to system and home. I know it is shitty, but it works (at least for me).

If you are going to use this script, this folder must be on your home folder. 

```bash
cd ~
git clone https://github.com/meppu/nix-config.git && cd nix-config
# Desktop profile for system (root <profile>):
sudo ./link.sh root desktop
# Home profile (home <target user>):
./link.sh home meppu
```
```bash
sudo nixos-rebuilt swich --upgrade
home-manager switch
```