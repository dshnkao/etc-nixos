{ pkgs, ... }:

{
  environment.variables = {
    #QT_PLUGIN_PATH = [ "${pkgs.plasma-desktop}/lib/qt-5.9/plugins/kcms" ];
    QT_QPA_PLATFORMTHEME = "qt5ct";
    GTK_THEME = "Adwaita:light";
  };

  environment.systemPackages = with pkgs; [
    (emacsWithPackages (p: with p.melpaStablePackages; [pdf-tools]))
    acpi
    arandr
    autojump
    blueman
    chromium
    curl
    feh
    firefox
    gnupg
    lsof
    lxappearance
    neovim
    pavucontrol 
    pinentry
    powertop
    psmisc
    qt5ct
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
