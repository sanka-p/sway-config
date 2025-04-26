{
  pkgs,
  lib,
  username,
  ...
}: {
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = ["networkmanager" "wheel" "dialout"];
  };

  # Customise /etc/nix/nix.conf declaratively via `nix.settings`
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
  };

  # Do garbage collection weekly to keep disk usage low
  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Set your time zone.
  time.timeZone = "Asia/Colombo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

#   TODO
#   i18n.extraLocaleSettings = {
#     LC_ADDRESS = "";
#     LC_IDENTIFICATION = "";
#     LC_MEASUREMENT = "";
#     LC_MONETARY = "";
#     LC_NAME = "";
#     LC_NUMERIC = "";
#     LC_PAPER = "";
#     LC_TELEPHONE = "";
#     LC_TIME = "";
#   };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable the OpenSSH daemon.
  programs.ssh.startAgent = true;
  services.openssh.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    curl
    git
    neofetch
    fzf
  ];

  services.flatpak.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

    # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # ===============FONTS===============
  fonts = {
    # enableDefaultPackages = true;
    packages = with pkgs; [ 
      nerdfonts
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [  "IosevkaTerm Nerd Font" ];
        sansSerif = [ "IosevkaTerm Nerd Font" ];
        monospace = [ "IosevkaTerm Nerd Font" ];
      };
    };
  };
}
