# Media stack

This is a docker stack that you could use to run the following containers
- radarr
- sonarr
- jackett

All of which are routed through a delugevpn container that includes a vpn.

Disclaimer to not use this, because if you do it wrong, you will! get caught! And its expensive. 

But lets say, hypothecially, you and me we would start this up and actually wanted to download files with it:

Ensure to use a private indexer, do not use piratebay or sth. You can look [r/usenet](https://www.reddit.com/r/usenet/wiki/indexers/) for indexers or just google a bit. You might have a friend that already uses one.

## Caddyfile

If I would serve this, this is what the caddyfile configuration would look like.
It is configured to be served on a root subdomain (which just shows a simple webpage, thats why the fileserver is at the bottom), the individual containers are then served via subpaths

```
import header.snippet

streaming.jonnyebinger.de {
  redir /radarr /radarr/
  redir /sonarr /sonarr/
  redir /jellyfin /jellyfin/

 
 reverse_proxy /radarr/* {
		to delugevpn:7878 
      import header1
	}
 reverse_proxy /sonarr/* {
		to delugevpn:8989 
      import header1
	}

 reverse_proxy /jellyfin/* {
		to jellyfin:8096 
      import header1
	}


  root * /srv/streaming
  encode gzip
  file_server

log {
      output discard
  }

}


```