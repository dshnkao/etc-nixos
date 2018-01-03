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
    xserver = {
      enable = true;
      layout = "us";
      xkbOptions = "ctrl:nocaps, altwin:swap_alt_win";
      libinput.enable = true;
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
      # synaptics = {
      #   enable = true;
      #   twoFingerScroll = true;
      #   vertEdgeScroll = true;
      #   palmDetect = true;
      # };
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
