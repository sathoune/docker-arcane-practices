.PHONY: u d ub dev dev-down
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
