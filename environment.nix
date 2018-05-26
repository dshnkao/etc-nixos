{ pkgs, ... }:

{
  environment.variables = {
    #QT_PLUGIN_PATH = [ "${pkgs.plasma-desktop}/lib/qt-5.9/plugins/kcms" ];
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_AUTO_SCREEN_SCALE_FACTOR = "0 zeal";
    GTK_THEME = "Adwaita:light";
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
