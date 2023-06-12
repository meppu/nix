{ ... }:

{
  nix = {
    gc = {
	  automatic = true;
	  dates = "weekly";
	  options = "--delete-older-than 14d";
	};

    settings.experimental-features = [ "nix-command" "flakes" ];
  };
  
  nixpkgs.config.allowUnfree = true;
}