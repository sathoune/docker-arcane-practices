set -e

docker compose -f compose.yml -f compose.ci.yml up -d --wait
sleep 5

printf "\n\nRead server test \n"
curl --fail localhost:8000/healtz

printf "\n\nWrite server test\n"
curl --fail localhost:8008/healtz
printf "\n\nClient test\n"
curl --fail localhost:3000

docker compose down