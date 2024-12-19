# Invidious
A secure youtube frontend I am hosting on my domain.
I use it with the clipious app on my phone and it works very well.

I have a script that runs in a cronjob every hour, updates the docker container and then restarts them
```
0 * * * * /data/docker-compose/invidious/update-and-restart.sh
```