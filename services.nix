{ pkgs, ... }:

{
  services = {
    printing.enable = true;
    printing.drivers = [ pkgs.splix ];
    netdata.enable = true;
    nscd.enable = false;
    dbus.socketActivated = true;
    dbus.enable = true;
    nginx = {
      enable = true;
      recommendedProxySettings = true;
      virtualHosts."localhost" = {
        forceSSL = true;
        root = "/srv/www";
        sslCertificateKey = "/srv/key.pem";
        sslCertificate = "/srv/cert.pem";
        basicAuthFile = "/srv/.htpasswd";
        locations."/" = {
          extraConfig = ''
            autoindex on;
          '';
        };
      };
    };
    tlp = {
      enable = true;
      extraConfig = ''
        USB_BLACKLIST_BTUSB=1
      '';
    };
    emacs = {
      package = pkgs.myemacs;
      enable = true;
      install = true;
    };
    redshift = {
      enable = true;
      temperature.day = 5000;
      temperature.night = 3000;
    };
    postgresql = {
      enable = true;
      package = pkgs.postgresql96;
      port = 5432;
      #extraPlugins = [
      #  (pkgs.postgis.override { postgresql = pkgs.postgresql96; })
      #];
      authentication = pkgs.lib.mkOverride 10 ''
        local all all trust
        host all all 127.0.0.1/32 trust
        host all all ::1/128 trust
      '';
    };
    xserver = {
      enable = true;
      layout = "us";
      xkbOptions = "ctrl:nocaps, altwin:swap_alt_win";
      # multitouch.enable = true;
      libinput.enable = true;
      # synaptics = {
      #   enable = true;
      #   twoFingerScroll = true;
      #   vertEdgeScroll = true;
      #   palmDetect = true;
      #   accelFactor = "0.5";
      #   minSpeed = "0.8";
      #   maxSpeed = "1.5";
      # };
      displayManager.lightdm = {
        enable = true;
        background = "/usr/share/lightdm.jpg";
      };
      desktopManager.plasma5.enable = true;
      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
        extraPackages = haskellPackages: [
          haskellPackages.gtk2hs-buildtools
          haskellPackages.dbus
          #haskellPackages.taffybar
        ];
      };
    };

    udev.extraRules = ''
      SUBSYSTEM=="usb", ATTRS{idVendor}=="28de", MODE="0666"
      KERNEL=="uinput", MODE="0660", GROUP="pgriffais", OPTIONS+="static_node=uinput"
      KERNEL=="hidraw*", ATTRS{idVendor}=="28de", MODE="0666"
      KERNEL=="hidraw*", KERNELS=="*28DE:*", MODE="0666"
      KERNEL=="hidraw*", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="05c4", MODE="0666"
      KERNEL=="hidraw*", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="0ba0", MODE="0666"
      KERNEL=="hidraw*", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="09cc", MODE="0666"
      KERNEL=="hidraw*", KERNELS=="*054C:05C4*", MODE="0666"
      KERNEL=="hidraw*", KERNELS=="*054C:09CC*", MODE="0666"
    '';
  };
}
