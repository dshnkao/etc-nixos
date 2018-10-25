{ config, pkgs, ... }:

{
  imports =
    [
      ./environment.nix
      ./hardware-configuration.nix
      ./multi-glibc-locale-paths.nix
      ./networking.nix
      ./services.nix
      ./systemd.nix
    ];

  nixpkgs.config.allowUnfree = true;

  #nixpkgs.overlays = [
  #  (self: super: {
  #    # 1.8.16 has broken vpn connection
  #    networkmanagerapplet = super.networkmanagerapplet.overrideAttrs (oldAttrs: rec {
  #      src = pkgs.fetchurl {
  #        url = "mirror://gnome/sources/network-manager-applet/1.8/network-manager-applet-1.8.18.tar.xz";
  #        sha256 = "0y31g0lxr93370xi74hbpvcy9m81n5wdkdhq8xy2nqp0y4219p13";
  #      };
  #    });
  #  })
  #];

  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    pulseaudio = {
      enable = true;
      support32Bit = true;
      package = pkgs.pulseaudioFull;
    };
    bluetooth.enable = true;
    bluetooth.extraConfig = ''
      [General]
      Enable=Source,Sink,Media,Socket
    '';
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
    inputMethod = {
      #enabled = "fcitx";
      #fcitx.engines = with pkgs.fcitx-engines; [ chewing ];
    };
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
      font-awesome_5
      inconsolata
      noto-fonts
      powerline-fonts
      siji
      source-code-pro
      source-han-sans-japanese
      source-han-sans-korean
      source-han-sans-simplified-chinese
      source-han-sans-traditional-chinese
      source-han-serif-japanese
      source-han-serif-korean
      source-han-serif-simplified-chinese
      source-han-serif-traditional-chinese
      unifont
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
    lxc.enable = true;
    lxd.enable = true;
    libvirtd.enable = true;
    virtualbox.host.enable = false;
    docker = {
      enable = true;
      enableOnBoot = false;
    };
  };

  security = {
    wrappers = {
      pmount.source = "${pkgs.pmount}/bin/pmount";
      pumount.source = "${pkgs.pmount}/bin/pumount";
    };
    # apparmor.enable = true;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 100d";
  };

  nix.binaryCaches = [
    "https://cache.nixos.org"
  ];
  nix.trustedBinaryCaches = [
    "https://cache.nixos.org"
  ];
  nix.binaryCachePublicKeys = [
    "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.dennis = {
    isNormalUser = true;
    uid = 1000;
    home = "/home/dennis";
    group = "users";
    description = "Dennis Kao";
    extraGroups = [ "wheel" "networkmanager" "vboxusers" "docker" "lxd" ];
    shell = pkgs.zsh;
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "18.03";
}
