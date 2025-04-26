{ 
    config, 
    pkgs, 
    ... 
}: {
    imports =
        [
        ../../modules/system.nix
        # ../../modules/sway.nix
        ../../modules/plasma.nix


        # Include the results of the hardware scan.
        ./hardware-configuration.nix
        ];

    # Bootloader.
    boot.loader = {
        efi = {
            canTouchEfiVariables = true;
        };
        systemd-boot.enable = true;
    };

    # networking.hostname = "swift3"; # TODO Define hostname
    networking.networkmanager.enable = true;

#   networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  services.blueman.enable = true;


   # TODO: Move to a more logical place
   virtualisation.virtualbox.host.enable = true;
   users.extraGroups.vboxusers.members = [ "sanka" ];
   #home.extraGroups = {
   # vboxusers.members = [ "sanka" ]; # TODO: Add username from config parama
   #};
   virtualisation.virtualbox.host.enableExtensionPack = true;

  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;   

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
