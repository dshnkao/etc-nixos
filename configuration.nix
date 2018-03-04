{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./environment.nix
      ./services.nix
      ./networking.nix
    ];

  nixpkgs.config.allowUnfree = true;

  hardware = { 
    opengl = {
      driSupport = true;
      driSupport32Bit = true;
    };
    pulseaudio = {
      enable = true;
      support32Bit = true;
      package = pkgs.pulseaudioFull;
    };
    bluetooth.enable = true;
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.initrd.luks.devices = [
    {
      name = "root";
      device = "/dev/nvme0n1p3";
      preLVM = true;
    }
  ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelModules = [ "uinput" ];

  # Select internationalisation properties.
  i18n = {
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "Australia/Sydney";

  fonts = {
    enableDefaultFonts = true;
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      dejavu_fonts 
      emacs-all-the-icons-fonts
      fira-code
      fira-code-symbols
      font-awesome-ttf
      inconsolata
      powerline-fonts
      source-code-pro
      source-han-sans-traditional-chinese
      source-han-sans-simplified-chinese
      source-han-sans-japanese
      source-han-sans-korean
      source-han-serif-traditional-chinese
      source-han-serif-simplified-chinese
      source-han-serif-japanese
      source-han-serif-korean
    ];
    fontconfig = {
      defaultFonts = {
        monospace = [ "DejaVu Sans Mono" ];
        sansSerif = [ "DejaVu Sans" ];
        serif = [ "DejaVu Serif" ];
      };
    };
  };

  virtualisation = {
    virtualbox.host.enable = true;
    docker = {
      enable = true;
      enableOnBoot = false;
    };
  };

  programs = {
    zsh = { 
      enable = true;
      syntaxHighlighting.enable = true;
    };
    gnupg = {
      agent.enable = true;
      agent.enableExtraSocket = true;
    };
    ssh.startAgent = true;
    java.enable = true;
  };

  security.wrappers = {
    pmount.source = "${pkgs.pmount}/bin/pmount"; 
    pumount.source = "${pkgs.pmount}/bin/pumount";
    slock.source = "${pkgs.slock}/bin/slock";
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  nix.binaryCaches = [ "https://cache.nixos.org" "https://hydra.iohk.io" ];
  nix.binaryCachePublicKeys = [ "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ=" ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.dennis = {
    isNormalUser = true;
    uid = 1000;
    home = "/home/dennis";
    group = "users";
    description = "Dennis Kao";
    extraGroups = [ "wheel" "networkmanager"];
    shell = pkgs.zsh;
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.09";

}
