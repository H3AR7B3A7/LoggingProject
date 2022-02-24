#!/bin/bash
echo --- DESTROYING DOCKER CONTAINERS AND VOLUMES ---
docker-compose down -v
echo --- DONE! ---
exec "$SHELL"