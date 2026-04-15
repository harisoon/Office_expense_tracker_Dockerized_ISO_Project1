#!/bin/bash

echo "Kreiranje Docker mreže i volumena..."
docker network create rtpp_network 2>/dev/null || echo "Mreža već postoji."
docker volume create postgres_data 2>/dev/null || echo "Volume već postoji."

echo "Buildanje Flask imagea..."
docker compose build flask

echo "Priprema završena!"