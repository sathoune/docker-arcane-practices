set -e

docker compose -f compose.yml -f compose.ci.yml up -d --build
docker compose down

docker tag app-read-backend "$DOCKER_REGISTRY_URL"/"$READ_BACKEND_IMAGE"
docker tag app-write-backend "$DOCKER_REGISTRY_URL"/"$WRITE_BACKEND_IMAGE"
docker tag app-frontend "$DOCKER_REGISTRY_URL"/"$FRONTEND_IMAGE"

docker push "$DOCKER_REGISTRY_URL"/"$READ_BACKEND_IMAGE"
docker push "$DOCKER_REGISTRY_URL"/"$WRITE_BACKEND_IMAGE"
docker push "$DOCKER_REGISTRY_URL"/"$FRONTEND_IMAGE"

