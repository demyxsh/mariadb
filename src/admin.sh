#!/bin/bash
# Demyx
# https://demyx.sh
set -euo pipefail

# Sleep until server is ready
until mysqladmin -u root status 2>/dev/null
do
    sleep .5
done

# Set root password
mysqladmin -u root password "$MARIADB_ROOT_PASSWORD"
