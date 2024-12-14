# Wireguard

I have a VPS from netcup, where I host a few more things on a public IP-address. 
I wanted to make the move to fully use the public IP, but this is working quite well so I haven't changed it.

The other side of the tunnel is installed on the system and not in a container.
The cool thing about this is that I can directly route everything I want from the caddy instance on the VPS into my docker network `proxy-net`.

This means I can reference the docker ip-addresses and there is no possibility whatsoever to reach anything on my local network, because I blocked that traffic. You can reach the other docker containers, but thats necessary of course.

Ensure you have opened the wireguard port `51820` on your router.