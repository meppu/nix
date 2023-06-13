{ pkgs, ... }:

{
  users.users.meppu = {
    isNormalUser = true;
    
    description = "meppu";
    hashedPassword = "$y$j9T$oGwZqozd5geXHAiIeTVf31$CAv12kL4yiWAIuBpgjjieSYS9AP235moG9mkFEGNvY2";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];

    shell = pkgs.fish;
  };
}