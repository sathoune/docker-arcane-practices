default: u

u: d
	docker compose up -d

d:
	docker compose down --remove-orphans

ub: d
	docker compose up -d --build
