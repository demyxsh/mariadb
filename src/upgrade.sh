#!/bin/bash
# Demyx
# https://demyx.sh
set -euom pipefail

# Support for old variables
[[ -n "${MARIADB_DATABASE:-}" ]] && DEMYX_DATABASE="$MARIADB_DATABASE"
[[ -n "${MARIADB_PASSWORD:-}" ]] && DEMYX_PASSWORD="$MARIADB_PASSWORD"
[[ -n "${MARIADB_ROOT_PASSWORD:-}" ]] && DEMYX_ROOT_PASSWORD="$MARIADB_ROOT_PASSWORD"
[[ -n "${MARIADB_USERNAME:-}" ]] && DEMYX_USERNAME="$MARIADB_USERNAME"

# Generate my.cnf
/usr/local/bin/demyx-config

# Exit container if these environment variables aren't set
if [[ -z "${DEMYX_ROOT_PASSWORD:=}" || -z "${DEMYX_DATABASE:=}" || -z "${DEMYX_USERNAME:=}" || -z "${DEMYX_PASSWORD:=}" ]]; then 
    /bin/echo "[demyx] DEMYX_ROOT_PASSWORD, DEMYX_DATABASE, DEMYX_USERNAME, and/or DEMYX_PASSWORD are not set! Exiting..."
    exit 1
fi

# Exit container if database doesn't exist
if [[ ! -d /var/lib/mysql/"$DEMYX_DATABASE" ]]; then
    /bin/echo "[demyx] /var/lib/mysql/${DEMYX_DATABASE} doesn't exist! Exiting..."
    exit 1
fi
    
# Remove old logfiles so mysqld can start
/bin/rm -f /var/lib/mysql/ib_logfile*

# Run in the background first
/usr/bin/mysqld_safe --skip-grant-tables &

# Sleep until server is ready
until /usr/bin/mysqladmin -u root status 2>/dev/null; do
    sleep .5
done

# Export database
/usr/bin/mysqldump -u root "$DEMYX_DATABASE" > "$DEMYX"/"$DEMYX_DATABASE".sql

# Initialize database
/usr/bin/mysql_install_db --user=demyx --datadir="$DEMYX" --skip-test-db

# Kill mysql with the dangerous flag and rerun mysql
/usr/bin/pkill mysql
/bin/sleep 5
/usr/bin/mysqld_safe &

# Sleep until server is ready
until /usr/bin/mysqladmin -u root status 2>/dev/null; do
    sleep .5
done

# Set root password
/usr/bin/mysqladmin -u root password "$DEMYX_ROOT_PASSWORD"

# Recreate database and user
/usr/bin/mysql -u root -p"$DEMYX_ROOT_PASSWORD" -e "CREATE DATABASE $DEMYX_DATABASE; CREATE USER '$DEMYX_USERNAME' IDENTIFIED BY '$DEMYX_PASSWORD'; GRANT USAGE ON *.* TO '$DEMYX_USERNAME'@'%' IDENTIFIED BY '$DEMYX_PASSWORD'; GRANT ALL privileges ON $DEMYX_DATABASE.* TO '$DEMYX_USERNAME'@'%';"

# Import database
/usr/bin/mysql -u root -p"$DEMYX_ROOT_PASSWORD" "$DEMYX_DATABASE" < "$DEMYX"/"$DEMYX_DATABASE".sql

# Remove database if exit code is 0
[[ "$?" = 0 ]] && /bin/rm -f "$DEMYX"/"$DEMYX_DATABASE".sql
