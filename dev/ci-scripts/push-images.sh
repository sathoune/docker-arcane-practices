set -e

docker compose up -d --build
docker compose down --remove-orphans


