#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER ${APP_USER} PASSWORD '${APP_PASSWORD}';
    CREATE DATABASE ${APP_DB} OWNER ${APP_USER};
EOSQL

#    CREATE USER docker;
#    CREATE DATABASE docker;
#    GRANT ALL PRIVILEGES ON DATABASE docker TO docker;
