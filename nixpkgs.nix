{ pkgs, ... }:

{
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


  nixpkgs.config.packageOverrides = pkgs: {
  # (emacsWithPackages (p: with p.melpaStablePackages; [pdf-tools]))
    myemacs = (pkgs.emacsPackagesNg.overrideScope' (self: super: {
      imagemagick = pkgs.imagemagick;
    })).emacsWithPackages (epkgs: [ ]); #epkgs.pdf-tools ]);
  };
}
