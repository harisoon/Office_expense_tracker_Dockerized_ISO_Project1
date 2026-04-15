#!/bin/bash

echo "Brisanje kontejnera, mreža i volumena..."
docker compose down -v

echo "Brisanje Docker image..."
docker rmi rtpp_flask rtpp_postgres rtpp_nginx 2>/dev/null || true

echo "Završetak brisanja."