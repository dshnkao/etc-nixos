{ pkgs, ... }:

{
  environment.variables = {
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_AUTO_SCREEN_SCALE_FACTOR = "0 zeal";
  };

  environment.systemPackages = with pkgs; [
    acpi
    alsaUtils
    arandr
    autojump
    blueman
    conky
    curl
    dzen2
    emacs
    feh
    firefox
    firejail
    gcc
    gnupg
    konsole
    linuxPackages_latest.bcc
    linuxPackages_latest.bpftrace
    linuxPackages_latest.perf
    lsof
    lxappearance
    pavucontrol
    pinentry
    powertop
    psmisc
    qt5ct
    rofi
    rxvt_unicode
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

  programs = {
    zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
    };
    gnupg = {
      agent.enable = true;
      agent.enableExtraSocket = true;
    };
    ssh = {
      forwardX11 = false;
      startAgent = true;
      agentTimeout = "24h";
    };
    java = {
      enable = true;
      package = pkgs.openjdk8;
    };
    # slock with setuid wrapper
    slock.enable = true;
    firejail = {
      enable = true;
      wrappedBinaries = with pkgs; {
        chromium = "${chromium}/bin/chromium";
        # firefox = "${firefox-bin}/bin/firefox";
        feh = "${feh}/bin/feh";
      };
    };
  };
}
