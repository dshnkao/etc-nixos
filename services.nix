{ pkgs, ... }:

{
  services = {
    printing.enable = true;
    printing.drivers = [ pkgs.splix ];
    tlp = {
      enable = true;
      extraConfig = ''
        USB_BLACKLIST_BTUSB=1
      '';
    };
    emacs = {
      enable = true;
      install = true;
    };
    redshift = {
      enable = true;
      latitude = "-34";
      longitude = "151";
      temperature.day = 5000;
      temperature.night = 3000;
    };
    postgresql = {
      enable = true;
      package = pkgs.postgresql94;
      port = 5432;
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
          haskellPackages.taffybar
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
