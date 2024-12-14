# homeserver-docker-compose
These are all the docker compose stacks and their configuration, which run on my local home server.

I hope I am not exposing too much, but who knows...

# List of services

| service       | source                                                                                | port          | hosted (external, internal, both)         |
| ---           | ---                                                                                   | ---           |  ---                                      |
| adguard       | [AdguardTeam/AdGuardHome](https://github.com/AdguardTeam/AdGuardHome)                 | 53, 6080      | internal  |
| caddy         | [caddyserver/caddy](https://github.com/caddyserver/caddy)                             | 80, 443       | external  |
| code-server   | [linuxserver/code-server](https://docs.linuxserver.io/images/docker-code-server/)     | 910X          | external  |
| dns-updater   | [dynamic-dns-netcup-api repo](https://github.com/mm28ajos/dynamic-dns-netcup-api)     | host          | internal  |
| dockge        | [louislam/dockge](https://github.com/louislam/dockge)                                 | 5001          | internal  |
| invidious     | [iv-org/invidious](https://github.com/iv-org/invidious)                               | 3000          | external  |
| jellyfin      | [linuxserver/jellyfin](https://docs.linuxserver.io/images/docker-jellyfin/)           | 8096          | external  |
| kasm          | [linuxserver/kasm](https://docs.linuxserver.io/images/docker-kasm/)                   | 3000, 9443    | external  |
| linkwarden    | [linkwarden/linkwarden](https://github.com/linkwarden/linkwarden)                     | -             | external  |
| matrix        | [matrixdotorg/synapse](https://github.com/element-hq/synapse?tab=readme-ov-file), [matrix-org/sliding-sync](https://github.com/matrix-org/sliding-sync), [gabbysHub/matrix-webhook](https://github.com/gabbysHub/matrix-webhook)                                  | -            | external |
| media (radarr, sonarr, deluge, jackett) | [binhex/arch-delugevpn](https://github.com/binhex/arch-delugevpn), rest from linuxserver | jackett `9117`, radarr `7878`, sonarr `8989`, deluge `8112` | internal, external |
| monica        | [monicahq](https://github.com/monicahq/docker)                                            | -         | internal, external |
| nextcloud     | [nextcloud/all-in-one](https://github.com/nextcloud/all-in-one)                           | -         | external |
| nocodb        | [nocodb/nocodb](https://hub.docker.com/r/nocodb/nocodb)                                   | 8090      | internal, external |
| ollama        | [ollama/ollama](https://github.com/ollama/ollama), [open-webui](https://docs.openwebui.com/)  | 9007  | internal |
| vaultwarden (psw)   | [dani-garcia/vaultwarden](https://github.com/dani-garcia/vaultwarden/wiki)                | -         | external |
| smart-mirror  | [magicmirror2](https://github.com/MagicMirrorOrg/MagicMirror)                             | 9006      | internal |
| samba         | [ServerContainers/samba](https://github.com/ServerContainers/samba)                       | 137, 138, 139, 445 | internal |
| wireguard     | [wg-easy/wg-easy](https://github.com/wg-easy/wg-easy)                                     | 51820     | external