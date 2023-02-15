set -e

docker compose up -d --wait
sleep 5

printf "\n\nRead server test \n"
curl --fail "${SMOKE__READ_BACKEND_HOST}"/healtz
printf "\n\nWrite server test\n"
curl --fail "${SMOKE__WRITE_BACKEND_HOST}"/healtz
printf "\n\nClient test\n"
curl --fail "${SMOKE__FRONTEND_HOST}"

docker compose down --remove-orphans