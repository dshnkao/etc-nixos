{ pkgs, ... }:

{
  networking.hostName = "carbon";
  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = true;
    logRefusedConnections = true;
    allowedTCPPorts = [ 443 ];
    allowedUDPPorts = [ ];
    allowPing = false;
    connectionTrackingModules = [];
    autoLoadConntrackHelpers = false;
  };
  networking.nat.enable = true;
  networking.nat.externalInterface = "wlp4s0";
  networking.nat.internalInterfaces = [ "wg0" ];
  #networking.wireguard.interfaces = {
  #  wg0 = {
  #    ips = [ "10.100.0.1/24" ];
  #    listenPort = 51820;
  #    privateKeyFile = "/home/dennis/keys/wireguard/carbon/private";
  #    peers = [
  #      {
  #        # vaio
  #        publicKey = "ZqtzeElM3EG88cYtM/smM+GnREVjCga2/spJhNDEeTw=";
  #        allowedIPs = [ "0.0.0.0/0" ];
  #      }
  #    ];
  #  };
  #};
  networking.extraHosts = ''
    127.0.0.1 carbon
    127.0.0.1 adclick.g.doublecklick.net
    127.0.0.1 adeventtracker.spotify.com
    127.0.0.1 ads-fa.spotify.com
    127.0.0.1 analytics.spotify.com
    127.0.0.1 audio2.spotify.com
    127.0.0.1 b.scorecardresearch.com
    127.0.0.1 bounceexchange.com
    127.0.0.1 bs.serving-sys.com
    127.0.0.1 content.bitsontherun.com
    127.0.0.1 core.insightexpressai.com
    127.0.0.1 crashdump.spotify.com
    127.0.0.1 d2gi7ultltnc2u.cloudfront.net
    127.0.0.1 d3rt1990lpmkn.cloudfront.net
    127.0.0.1 desktop.spotify.com
    127.0.0.1 doubleclick.net
    127.0.0.1 ds.serving-sys.com
    127.0.0.1 googleadservices.com
    127.0.0.1 googleads.g.doubleclick.net
    127.0.0.1 gtssl2-ocsp.geotrust.com
    127.0.0.1 js.moatads.com
    127.0.0.1 log.spotify.com
    127.0.0.1 media-match.com
    127.0.0.1 omaze.com
    127.0.0.1 open.spotify.com
    127.0.0.1 pagead46.l.doubleclick.net
    127.0.0.1 pagead2.googlesyndication.com
    127.0.0.1 partner.googleadservices.com
    127.0.0.1 pubads.g.doubleclick.net
    127.0.0.1 redirector.gvt1.com
    127.0.0.1 s0.2mdn.net
    127.0.0.1 securepubads.g.doubleclick.net
    127.0.0.1 spclient.wg.spotify.com
    127.0.0.1 tpc.googlesyndication.com
    127.0.0.1 v.jwpcdn.com
    127.0.0.1 video-ad-stats.googlesyndication.com
    127.0.0.1 weblb-wg.gslb.spotify.com
    127.0.0.1 www.googleadservices.com
    127.0.0.1 www.googletagservices.com
    127.0.0.0 www.omaze.com'';
}
