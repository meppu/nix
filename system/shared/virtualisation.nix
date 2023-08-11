{pkgs, ...}: {
  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };

    libvirtd.enable = true;
  };

  environment.systemPackages = with pkgs; [
    virt-manager
  ];
}
