#!/bin/bash
# Demyx
# https://demyx.sh
set -euo pipefail

# Compatibility with old paths
[[ -d /var/lib/mysql/"${MARIADB_DATABASE:=''}" ]] && MARIADB_ROOT=/var/lib/mysql

# Generate my.cnf if it doesn't exist
[[ ! -f "$MARIADB_CONFIG"/my.cnf ]] && demyx-config

# Exit container if root password isn't set
if [[ -z "${MARIADB_ROOT_PASSWORD:=}" ]]; then 
    echo "[demyx] MARIADB_ROOT_PASSWORD is not set! Exiting..."
    exit 1
fi

if [[ ! -d "$MARIADB_ROOT"/"${MARIADB_DATABASE:=''}" ]]; then
    # Required so fg can be used - https://explainshell.com/explain?cmd=set+-m
    set -m

    # Populate /var/lib/mysql
    mysql_install_db --datadir="$MARIADB_ROOT" --skip-test-db

    # Run in the background first
    mysqld_safe &

    # Sudo wrapper for mysqladmin
    demyx-admin

    # Create custom database if these environment variables exists
    if [[ -n "${MARIADB_DATABASE:=}" && "${MARIADB_USERNAME:=}" && "${MARIADB_PASSWORD:=}" ]]; then
        mysql -u root "-p${MARIADB_ROOT_PASSWORD}" -e "CREATE DATABASE $MARIADB_DATABASE; CREATE USER '$MARIADB_USERNAME' IDENTIFIED BY '$MARIADB_PASSWORD'; GRANT USAGE ON *.* TO '$MARIADB_USERNAME'@'%' IDENTIFIED BY '$MARIADB_PASSWORD'; GRANT ALL privileges ON $MARIADB_DATABASE.* TO '$MARIADB_USERNAME'@'%';"
    else
        echo "[demyx] MARIADB_DATABASE, MARIADB_USERNAME, and/or MARIADB_PASSWORD environment variables not set, continuing without a database..."
    fi

    # Bring background job to the foreground
    fg %1
else
    mysqld_safe
fi
