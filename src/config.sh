#!/bin/bash
# Demyx
# https://demyx.sh
set -euo pipefail

# Support for old variables
[[ -n "${MARIADB_CHARACTER_SET_SERVER:-}" ]] && DEMYX_CHARACTER_SET_SERVER="$MARIADB_CHARACTER_SET_SERVER"
[[ -n "${MARIADB_COLLATION_SERVER:-}" ]] && DEMYX_COLLATION_SERVER="$MARIADB_COLLATION_SERVER"
[[ -n "${MARIADB_DEFAULT_CHARACTER_SET:-}" ]] && DEMYX_DEFAULT_CHARACTER_SET="$MARIADB_DEFAULT_CHARACTER_SET"
[[ -n "${MARIADB_DOMAIN:-}" ]] && DEMYX_DOMAIN="$MARIADB_DOMAIN"
[[ -n "${MARIADB_INNODB_BUFFER_POOL_SIZE:-}" ]] && DEMYX_INNODB_BUFFER_POOL_SIZE="$MARIADB_INNODB_BUFFER_POOL_SIZE"
[[ -n "${MARIADB_INNODB_DATA_FILE_PATH:-}" ]] && DEMYX_INNODB_DATA_FILE_PATH="$MARIADB_INNODB_DATA_FILE_PATH"
[[ -n "${MARIADB_INNODB_FILE_PER_TABLE:-}" ]] && DEMYX_INNODB_FILE_PER_TABLE="$MARIADB_INNODB_FILE_PER_TABLE"
[[ -n "${MARIADB_INNODB_FLUSH_LOG_AT_TRX_COMMIT:-}" ]] && DEMYX_INNODB_FLUSH_LOG_AT_TRX_COMMIT="$MARIADB_INNODB_FLUSH_LOG_AT_TRX_COMMIT"
[[ -n "${MARIADB_INNODB_LOCK_WAIT_TIMEOUT:-}" ]] && DEMYX_INNODB_LOCK_WAIT_TIMEOUT="$MARIADB_INNODB_LOCK_WAIT_TIMEOUT"
[[ -n "${MARIADB_INNODB_LOG_BUFFER_SIZE:-}" ]] && DEMYX_INNODB_LOG_BUFFER_SIZE="$MARIADB_INNODB_LOG_BUFFER_SIZE"
[[ -n "${MARIADB_INNODB_LOG_FILE_SIZE:-}" ]] && DEMYX_INNODB_LOG_FILE_SIZE="$MARIADB_INNODB_LOG_FILE_SIZE"
[[ -n "${MARIADB_INNODB_USE_NATIVE_AIO:-}" ]] && DEMYX_INNODB_USE_NATIVE_AIO="$MARIADB_INNODB_USE_NATIVE_AIO"
[[ -n "${MARIADB_KEY_BUFFER_SIZE:-}" ]] && DEMYX_KEY_BUFFER_SIZE="$MARIADB_KEY_BUFFER_SIZE"
[[ -n "${MARIADB_KEY_BUFFER_SIZE:-}" ]] && DEMYX_KEY_BUFFER_SIZE="$MARIADB_KEY_BUFFER_SIZE"
[[ -n "${MARIADB_MAX_ALLOWED_PACKET:-}" ]] && DEMYX_MAX_ALLOWED_PACKET="$MARIADB_MAX_ALLOWED_PACKET"
[[ -n "${MARIADB_MAX_ALLOWED_PACKET:-}" ]] && DEMYX_MAX_ALLOWED_PACKET="$MARIADB_MAX_ALLOWED_PACKET"
[[ -n "${MARIADB_MAX_CONNECTIONS:-}" ]] && DEMYX_MAX_CONNECTIONS="$MARIADB_MAX_CONNECTIONS"
[[ -n "${MARIADB_MYISAM_SORT_BUFFER_SIZE:-}" ]] && DEMYX_MYISAM_SORT_BUFFER_SIZE="$MARIADB_MYISAM_SORT_BUFFER_SIZE"
[[ -n "${MARIADB_NET_BUFFER_SIZE:-}" ]] && DEMYX_NET_BUFFER_SIZE="$MARIADB_NET_BUFFER_SIZE"
[[ -n "${MARIADB_READ_BUFFER:-}" ]] && DEMYX_READ_BUFFER="$MARIADB_READ_BUFFER"
[[ -n "${MARIADB_READ_BUFFER_SIZE:-}" ]] && DEMYX_READ_BUFFER_SIZE="$MARIADB_READ_BUFFER_SIZE"
[[ -n "${MARIADB_READ_RND_BUFFER_SIZE:-}" ]] && DEMYX_READ_RND_BUFFER_SIZE="$MARIADB_READ_RND_BUFFER_SIZE"
[[ -n "${MARIADB_SERVER_ID:-}" ]] && DEMYX_SERVER_ID="$MARIADB_SERVER_ID"
[[ -n "${MARIADB_SORT_BUFFER_SIZE:-}" ]] && DEMYX_SORT_BUFFER_SIZE="$MARIADB_SORT_BUFFER_SIZE"
[[ -n "${MARIADB_SORT_BUFFER_SIZE:-}" ]] && DEMYX_SORT_BUFFER_SIZE="$MARIADB_SORT_BUFFER_SIZE"
[[ -n "${MARIADB_TABLE_OPEN_CACHE:-}" ]] && DEMYX_TABLE_OPEN_CACHE="$MARIADB_TABLE_OPEN_CACHE"
[[ -n "${MARIADB_WRITE_BUFFER:-}" ]] && DEMYX_WRITE_BUFFER="$MARIADB_WRITE_BUFFER"

DEMYX_LOG_FILE=mariadb.log
[[ -n "$DEMYX_DOMAIN" ]] && DEMYX_LOG_FILE="$DEMYX_DOMAIN".mariadb.log

/bin/echo "# Demyx
# https://demyx.sh

[client]
default-character-set           = $DEMYX_DEFAULT_CHARACTER_SET

[client-server]
port                            = 3306
socket                          = ${DEMYX_CONFIG}/mariadb.sock

[myisamchk]
key_buffer_size                 = $DEMYX_KEY_BUFFER_SIZE
read_buffer                     = $DEMYX_READ_BUFFER
sort_buffer_size                = $DEMYX_SORT_BUFFER_SIZE
write_buffer                    = $DEMYX_WRITE_BUFFER

[mysql]
no-auto-rehash

[mysqld]
basedir                         = /usr
bind-address                    = 0.0.0.0
character-set-server            = $DEMYX_CHARACTER_SET_SERVER
collation-server                = $DEMYX_COLLATION_SERVER
datadir                         = $DEMYX
innodb_buffer_pool_size         = $DEMYX_INNODB_BUFFER_POOL_SIZE
innodb_data_file_path           = $DEMYX_INNODB_DATA_FILE_PATH
innodb_data_home_dir            = $DEMYX
innodb_file_per_table           = $DEMYX_INNODB_FILE_PER_TABLE
innodb_flush_log_at_trx_commit  = $DEMYX_INNODB_FLUSH_LOG_AT_TRX_COMMIT
innodb_lock_wait_timeout        = $DEMYX_INNODB_LOCK_WAIT_TIMEOUT
innodb_log_buffer_size          = $DEMYX_INNODB_LOG_BUFFER_SIZE
innodb_log_file_size            = $DEMYX_INNODB_LOG_FILE_SIZE
innodb_log_group_home_dir       = $DEMYX
innodb_use_native_aio           = $DEMYX_INNODB_USE_NATIVE_AIO
key_buffer_size                 = $DEMYX_KEY_BUFFER_SIZE
log-error                       = ${DEMYX_LOG}/${DEMYX_LOG_FILE}
max_allowed_packet              = $DEMYX_MAX_ALLOWED_PACKET
max_connections                 = $DEMYX_MAX_CONNECTIONS
myisam_sort_buffer_size         = $DEMYX_MYISAM_SORT_BUFFER_SIZE
net_buffer_length               = $DEMYX_NET_BUFFER_SIZE
pid-file                        = ${DEMYX_CONFIG}/mariadb.pid
read_buffer_size                = $DEMYX_READ_BUFFER_SIZE
read_rnd_buffer_size            = $DEMYX_READ_RND_BUFFER_SIZE
server-id                       = $DEMYX_SERVER_ID
skip-external-locking
sort_buffer_size                = $DEMYX_SORT_BUFFER_SIZE
symbolic-links                  = 0
table_open_cache                = $DEMYX_TABLE_OPEN_CACHE
tmpdir                          = /tmp

[mysqldump]
max_allowed_packet              = $DEMYX_MAX_ALLOWED_PACKET
quick
quote-names

[mysqlhotcopy]
interactive-timeout" > "$DEMYX_CONFIG"/my.cnf
