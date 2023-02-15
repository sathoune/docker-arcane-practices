## Dev environment
- [ ] Communication between services
- [ ] Redis persistence
## Pipelines
- [ ] Push images to Docker Registry
- [ ] Enable Registry persistence
- [ ] Automate with a script in Makefile
## Deployment
- [ ] Start services
- [ ] Pass relevant variables
- [ ] Deploy from Makefile
- [ ] Expose services to the `outside` world
## To consider
- [ ] Multiple `compose.yml` files
- [ ] Storing reused variables in `secret-service`
## Extra
- [ ] Use reverse proxy
- [ ] Add paths to services with traefik (Tip: `- traefik.http.routers.deployment.rule=Host
  (`application.address`)`)