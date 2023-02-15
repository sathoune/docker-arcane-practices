.PHONY: u d ub dev dev-down deployment pipeline
default: u

dev:
	cd dev && docker compose up -d && cd ..
dev-down:
	cd dev && docker compose down --remove-orphans && cd ..

u: d
	docker compose up -d

d:
	docker compose down --remove-orphans

ub: d
	docker compose up -d --build

pipeline:
	docker compose exec dind sh ./ci-scripts/smoke-test.sh
	docker compose exec dind sh ./ci-scripts/push-images.sh

deployment:
	docker compose exec deployment sh ./deploy.sh