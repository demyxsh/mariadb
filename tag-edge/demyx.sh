#!/bin/bash
# Demyx
# https://demyx.sh
set -euom pipefail

# Generate my.cnf if it doesn't exist
[[ ! -f /demyx/my.cnf ]] && demyx-config

# Exit container if root password isn't set
if [[ -z "${MARIADB_ROOT_PASSWORD:=}" ]]; then 
    echo "[demyx] MARIADB_ROOT_PASSWORD is not set! Exiting..."
    exit 1
fi

if [[ ! -d /var/lib/mysql/"${MARIADB_DATABASE:=}" ]]; then
    # Populate /var/lib/mysql
    mysql_install_db --user=demyx --datadir=/var/lib/mysql --skip-test-db

    # Run in the background first
    mysqld_safe &

    # Sleep until server is ready
    until mysqladmin -u root status 2>/dev/null
    do
        sleep .5
    done
    
    # Set root password
    mysqladmin -u root password "$MARIADB_ROOT_PASSWORD"

    # Create custom database if these environment variables exists
    if [[ -n "$MARIADB_DATABASE" && "$MARIADB_USERNAME" && "$MARIADB_PASSWORD" ]]; then
        mysql -u root "-p${MARIADB_ROOT_PASSWORD}" -e "CREATE DATABASE $MARIADB_DATABASE; CREATE USER '$MARIADB_USERNAME' IDENTIFIED BY '$MARIADB_PASSWORD'; GRANT USAGE ON *.* TO '$MARIADB_USERNAME'@'%' IDENTIFIED BY '$MARIADB_PASSWORD'; GRANT ALL privileges ON $MARIADB_DATABASE.* TO '$MARIADB_USERNAME'@'%';"
    else
        echo "[demyx] MARIADB_DATABASE, MARIADB_USERNAME, and/or MARIADB_PASSWORD environment variables not set, continuing without a database..."
    fi
    
    # Bring background job to the foreground
    fg %1
else
    mysqld_safe
fi
