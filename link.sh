#!/bin/sh

if [[ $# -ne 2 ]]; then
	echo "You must give manage level with second argument"
	exit 1
fi

MANAGE_LEVEL=$1
SECOND_ARG=$2

if [[ $MANAGE_LEVEL == "root" ]]; then
        read -p "This will purge your existing configuration, continue? [y/n]: " -n 1 -r
        echo

        if [[ $REPLY =~ ^[Nn]$ ]]; then
		exit 0
	fi

	echo "Unlink profiles, if exists"
	sudo unlink /etc/nixos
	unlink ~/nix-config/nixos/configuration.nix
	unlink ~/nix-config/nixos/hardware-configuration.nix

	OLD_CONFIG=".nix-old-config-$(date +%s)"
	
	echo "Saving current configuration to $OLD_CONFIG, if exists"
	sudo mv /etc/nixos ~/$OLD_CONFIG
	
	echo "Linking for profile: $SECOND_ARG"
	ln -s ~/nix-config/nixos/profiles/$SECOND_ARG/configuration.nix ~/nix-config/nixos/configuration.nix
	ln -s ~/nix-config/nixos/profiles/$SECOND_ARG/hardware-configuration.nix ~/nix-config/nixos/hardware-configuration.nix
	sudo ln -s ~/nix-config/nixos /etc
elif [[ $MANAGE_LEVEL == "user" ]]; then
	echo "Unlink home manager, if exists"
	unlink /home/$SECOND_ARG/.config/home-manager
	
	OLD_CONFIG=".nix-home-old-config-$(date +%s)"
	
    echo "Saving current configuration to $OLD_CONFIG, if exists"
    mv /home/$SECOND_ARG/.config/home-manager /home/$SECOND_ARG/$OLD_CONFIG
        
	echo "Linking home manager for: $SECOND_ARG"
	ln -s ~/nix-config/home-manager /home/$SECOND_ARG/.config
else
	echo "Invalid manage level!"
fi
