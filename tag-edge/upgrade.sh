#!/bin/bash
# Demyx
# https://demyx.sh
set -euom pipefail

# Generate my.cnf
demyx-config

# Exit container if these environment variables aren't set
if [[ -z "${MARIADB_ROOT_PASSWORD:=}" || -z "${MARIADB_DATABASE:=}" || -z "${MARIADB_USERNAME:=}" || -z "${MARIADB_PASSWORD:=}" ]]; then 
    echo "[demyx] MARIADB_ROOT_PASSWORD, MARIADB_DATABASE, MARIADB_USERNAME, and/or MARIADB_PASSWORD are not set! Exiting..."
    exit 1
fi

# Exit container if database doesn't exist
if [[ ! -d /var/lib/mysql/"$MARIADB_DATABASE" ]]; then
    echo "[demyx] /var/lib/mysql/${MARIADB_DATABASE} doesn't exist! Exiting..."
    exit 1
fi
    
# Remove old logfiles so mysqld can start
rm -f /var/lib/mysql/ib_logfile*

# Run in the background first
mysqld_safe --skip-grant-tables &

# Sleep until server is ready
until mysqladmin -u root status 2>/dev/null
do
    sleep .5
done

# Export database
mysqldump -u root "$MARIADB_DATABASE" > "$MARIADB_ROOT"/"$MARIADB_DATABASE".sql

# Initialize database
mysql_install_db --user=demyx --datadir="$MARIADB_ROOT" --skip-test-db

# Kill mysql with the dangerous flag and rerun mysql
pkill mysql
sleep 5
mysqld_safe &

# Sleep until server is ready
until mysqladmin -u root status 2>/dev/null
do
    sleep .5
done

# Set root password
mysqladmin -u root password "$MARIADB_ROOT_PASSWORD"

# Recreate database and user
mysql -u root -p"$MARIADB_ROOT_PASSWORD" -e "CREATE DATABASE $MARIADB_DATABASE; CREATE USER '$MARIADB_USERNAME' IDENTIFIED BY '$MARIADB_PASSWORD'; GRANT USAGE ON *.* TO '$MARIADB_USERNAME'@'%' IDENTIFIED BY '$MARIADB_PASSWORD'; GRANT ALL privileges ON $MARIADB_DATABASE.* TO '$MARIADB_USERNAME'@'%';"

# Import database
mysql -u root -p"$MARIADB_ROOT_PASSWORD" "$MARIADB_DATABASE" < "$MARIADB_ROOT"/"$MARIADB_DATABASE".sql

# Remove database if exit code is 0
[[ "$?" = 0 ]] && rm -f "$MARIADB_ROOT"/"$MARIADB_DATABASE".sql
