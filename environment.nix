{ pkgs, ... }:

{
  environment.variables = {
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_AUTO_SCREEN_SCALE_FACTOR = "0 zeal";
  };

  environment.systemPackages = with pkgs; [
    (emacsWithPackages (p: with p.melpaStablePackages; [pdf-tools]))
    acpi
    alsaUtils
    arandr
    autojump
    blueman
    chromium
    conky
    curl
    dzen2
    feh
    firefox-bin
    gcc
    gnupg
    konsole
    lsof
    lxappearance
    pavucontrol 
    pinentry
    powertop
    psmisc
    qt5ct
    rofi
    rxvt_unicode
    slock
    taffybar
    tmux
    vim
    wget
    which
    xclip
    xdotool
    xorg.xbacklight
    xorg.xcursorthemes
    xorg.xev
    xsel
  ];

}
