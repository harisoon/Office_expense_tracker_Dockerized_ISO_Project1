#!/bin/bash
export MSYS_NO_PATHCONV=1
docker compose up -d
sleep 7

docker cp sql/lokalna_baza_backup.sql rtpp_postgres:/backup.sql
docker exec rtpp_postgres psql -U expense_user -d office_expense_db -f /backup.sql
docker exec rtpp_flask flask db stamp head

echo "Aplikacija je dostupna na sljedećem linku: http://localhost (Login: haris.vikalo@fet.ba --- admin123)"