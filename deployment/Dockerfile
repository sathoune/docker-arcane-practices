FROM docker:20-dind
WORKDIR /app
RUN apk add curl

COPY ./dev/ci-scripts/deploy.sh ./deploy.sh
COPY ./dev/compose.yml ./compose.yml
COPY ./dev/compose.prod.yml ./compose.prod.yml