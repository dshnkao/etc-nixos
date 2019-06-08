{ pkgs, ... }:

{
  systemd = {
    services = {
      postgresql = {
        enable = true;
        wantedBy = pkgs.lib.mkForce [];
      };
      nginx = {
        enable = true;
        wantedBy = pkgs.lib.mkForce [];
      };
      netdata = {
        enable = true;
        wantedBy = pkgs.lib.mkForce [];
      };
      init-script = {
        description = "run on boot";
        serviceConfig = {
          ExecStart = "/bin/sh -c 'rm -f /home/dennis/.xmonad/xmonad.state'";
        };
        wantedBy = [ "multi-user.target" ];
      };
    };
    user.services.sync-book = {
        description = "sync ebooks";
        serviceConfig = {
          ExecStart = "/bin/sh -c '/run/current-system/sw/bin/rsync -a /home/dennis/unrepos/ebooks/ denniskao.com:/home/dennis/unrepos/ebooks'";
        };
        wantedBy = [ "multi-user.target" ];
    };
    user.timers.sync-book = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnBootSec = "10m";
        OnCalendar = "daily";
        Unit = "sync-book.service";
        Persistent = "true";
      };
    };
  };
}
