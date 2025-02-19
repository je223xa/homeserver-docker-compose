cd /data/docker-compose/invidious
docker compose pull
docker compose up --force-recreate --build -d
docker image prune -f
