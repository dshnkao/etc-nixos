{ pkgs, ... }:

{
  environment.variables = {
    #QT_PLUGIN_PATH = [ "${pkgs.plasma-desktop}/lib/qt-5.9/plugins/kcms" ];
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
    autoconf
    autocutsel
    autojump
    automake
    binutils
    blueman
    cabal2nix
    chromium
    clang
    conky
    curl
    dzen2
    emacs
    emacsPackagesNg.melpaPackages.ac-ispell
    emacsPackagesNg.melpaPackages.pdf-tools
    evince
    exa
    fd
    file
    firefox-devedition-bin-unwrapped
    fzf
    gcc
    git
    gnumake
    gnupg
    gstreamer
    haskellPackages.cabal-install
    haskellPackages.ghc
    haskellPackages.purescript
    haskellPackages.stack
    haskellPackages.styx
    htop
    imagemagick
    jetbrains.idea-community
    jq
    ktorrent
    libreoffice
    lsof
    lxappearance
    m4
    maven
    ncurses6
    neofetch
    neovim
    nix-prefetch-git
    nix-repl
    nmap
    nodePackages.tern
    openjdk8
    pandoc
    pass
    patchelf
    pavucontrol 
    pinentry
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
    slock
    smartmontools
    spotify
    sqlite
    steam
    stow
    stress
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
    xdotool
    xorg.xbacklight
    xorg.xcursorthemes
    xorg.xev
    xournal
    xsel
    zathura
    zip
  ];

}
