{ pkgs, ... }:

{
  systemd = {
    services = {
      init-script = {
        description = "run on boot";
        serviceConfig = {
          ExecStart = "/bin/sh -c 'rm -f /home/dennis/.xmonad/xmonad.state'";
        };
        wantedBy = [ "multi-user.target" ];
      };
    };
  };
}
