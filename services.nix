{ pkgs, ... }:

{
  services = {
    printing.enable = true;
    printing.drivers = [ pkgs.splix ];
    tlp = {
      enable = false;
      extraConfig = ''
        USB_BLACKLIST_BTUSB=1
      '';
    }
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
      displayManager.lightdm.enable = true;
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
  };
}
