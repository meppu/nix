{ ... }:

{
  nix = {
    # Just disabled it since i don't really need (i always collect garbages when i need):

    # gc = {
    #  automatic = true;
    #  dates = "weekly";
    #  options = "--delete-older-than 14d";
    # };

    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };
  
  nixpkgs.config.allowUnfree = true;
}
