#!/bin/bash
# Demyx
# https://demyx.sh
set -euo pipefail

# Support for old variables
[[ -n "${MARIADB_ROOT_PASSWORD:-}" ]] && DEMYX_ROOT_PASSWORD="$MARIADB_ROOT_PASSWORD"

# Sleep until server is ready
until /usr/bin/mysqladmin -u root status 2>/dev/null; do
    sleep .5
done

# Set root password
/usr/bin/mysqladmin -u root password "$DEMYX_ROOT_PASSWORD"
