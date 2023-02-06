set -e

docker compose up -d --build
docker compose down

docker tag app-python-app "$DOCKER_REGISTRY_URL"/"$PYTHON_IMAGE"
docker tag app-elixir-app "$DOCKER_REGISTRY_URL"/"$ELIXIR_IMAGE"
docker tag app-postgres "$DOCKER_REGISTRY_URL"/"$POSTGRES_IMAGE"

docker push "$DOCKER_REGISTRY_URL"/"$PYTHON_IMAGE"
docker push "$DOCKER_REGISTRY_URL"/"$ELIXIR_IMAGE"
docker push "$DOCKER_REGISTRY_URL"/"$POSTGRES_IMAGE"
