#!/bin/bash
# Demyx
# https://demyx.sh
set -euo pipefail

# Support for old variables
[[ -n "${MARIADB_DATABASE:-}" ]] && DEMYX_DATABASE="$MARIADB_DATABASE"
[[ -n "${MARIADB_PASSWORD:-}" ]] && DEMYX_PASSWORD="$MARIADB_PASSWORD"
[[ -n "${MARIADB_ROOT_PASSWORD:-}" ]] && DEMYX_ROOT_PASSWORD="$MARIADB_ROOT_PASSWORD"
[[ -n "${MARIADB_USERNAME:-}" ]] && DEMYX_USERNAME="$MARIADB_USERNAME"

# Compatibility with old paths
[[ -d /var/lib/mysql/"${DEMYX_DATABASE:=''}" ]] && DEMYX=/var/lib/mysql

# Generate my.cnf if it doesn't exist
[[ ! -f "$DEMYX_CONFIG"/my.cnf ]] && /usr/local/bin/demyx-config

# Exit container if root password isn't set
if [[ -z "${DEMYX_ROOT_PASSWORD:-}" ]]; then 
    /bin/echo "[demyx] DEMYX_ROOT_PASSWORD is not set! Exiting..."
    exit 1
fi

if [[ ! -d "$DEMYX"/"${DEMYX_DATABASE:=''}" ]]; then
    # Required so fg can be used - https://explainshell.com/explain?cmd=set+-m
    set -m

    # Populate /var/lib/mysql
    /usr/bin/mysql_install_db --datadir="$DEMYX" --skip-test-db

    # Run in the background first
    /usr/bin/mysqld_safe &

    # Sudo wrapper for mysqladmin
    /usr/local/bin/demyx-admin

    # Create custom database if these environment variables exists
    if [[ -n "${DEMYX_DATABASE:=}" && "${DEMYX_USERNAME:=}" && "${DEMYX_PASSWORD:=}" ]]; then
        /usr/bin/mysql -u root "-p${DEMYX_ROOT_PASSWORD}" -e "CREATE DATABASE $DEMYX_DATABASE; CREATE USER '$DEMYX_USERNAME' IDENTIFIED BY '$DEMYX_PASSWORD'; GRANT USAGE ON *.* TO '$DEMYX_USERNAME'@'%' IDENTIFIED BY '$DEMYX_PASSWORD'; GRANT ALL privileges ON $DEMYX_DATABASE.* TO '$DEMYX_USERNAME'@'%';"
    else
        /bin/echo "[demyx] DEMYX_DATABASE, DEMYX_USERNAME, and/or DEMYX_PASSWORD environment variables not set, continuing without a database..."
    fi

    # Bring background job to the foreground
    fg %1
else
    /usr/bin/mysqld_safe
fi
