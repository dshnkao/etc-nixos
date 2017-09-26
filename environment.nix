{ pkgs, ... }:

{
  environment.variables = {
    QT_PLUGIN_PATH = [ "${pkgs.plasma-desktop}/lib/qt-5.9/plugins/kcms" ];
    QT_QPA_PLATFORMTHEME = "qt5ct";
    GTK_THEME = "Adwaita:light";
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
      acpi
      ag
      arandr
      aspell
      autocutsel
      binutils
      blueman
      chromium
      conky
      curl
      docker
      dzen2
      emacs
      emacsPackagesNg.melpaPackages.ac-ispell
      emacsPackagesNg.melpaPackages.pdf-tools
      evince
      firefox
      fzf
      git
      gnumake
      gnupg
      haskellPackages.cabal-install
      haskellPackages.ghc
      haskellPackages.stack
      htop
      imagemagick
      jetbrains.idea-community
      ktorrent
      lsof
      lxappearance
      maven
      ncurses6
      neofetch
      neovim
      nmap
      openjdk8
      pandoc
      pass
      pavucontrol 
      pinentry
      pkgconfig
      pmount
      powertop
      psmisc
      python
      python36
      qt5ct
      ranger
      redshift
      ripgrep
      rofi
      rxvt_unicode
      sbt
      scala
      scrot
      smartmontools
      spotify
      sqlite
      steam
      stow
      taffybar
      texlive.combined.scheme-full
      tmux
      tree
      unison
      unzip
      vim
      vlc
      vscode
      wget
      which
      xclip
      xorg.xbacklight
      xorg.xcursorthemes
      xorg.xev
      zathura
      zip
  ];

}
