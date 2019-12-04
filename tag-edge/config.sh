#!/bin/sh
# Demyx
# https://demyx.sh
set -euo pipefail

MARIADB_LOG=mariadb.log
# Change log name if MARIADB_DOMAIN is available
[[ -n "${MARIADB_DOMAIN:=}" ]] && MARIADB_LOG="$MARIADB_DOMAIN".mariadb.log

echo "# Demyx
# https://demyx.sh

[client-server]
socket                          = /demyx/mariadb.sock
port                            = 3306

[client]
default-character-set           = ${MARIADB_DEFAULT_CHARACTER_SET:=utf8}

[mysqld]
skip-external-locking
bind-address                    = 0.0.0.0
log-error                       = /var/log/demyx/${MARIADB_LOG}
basedir                         = /usr
datadir                         = /var/lib/mysql
pid-file                        = /demyx/mariadb.pid
symbolic-links                  = 0
tmpdir                          = /tmp
character-set-server            = ${MARIADB_CHARACTER_SET_SERVER:=utf8}
collation-server                = ${MARIADB_COLLATION_SERVER:=utf8_general_ci}
key_buffer_size                 = ${MARIADB_KEY_BUFFER_SIZE:=20M}
max_allowed_packet              = ${MARIADB_MAX_ALLOWED_PACKET:=16M}
table_open_cache                = ${MARIADB_TABLE_OPEN_CACHE:=64}
sort_buffer_size                = ${MARIADB_SORT_BUFFER_SIZE:=20M}
net_buffer_length               = ${MARIADB_NET_BUFFER_SIZE:=8K}
read_buffer_size                = ${MARIADB_READ_BUFFER_SIZE:=256K}
read_rnd_buffer_size            = ${MARIADB_READ_RND_BUFFER_SIZE=512K}
myisam_sort_buffer_size         = ${MARIADB_MYISAM_SORT_BUFFER_SIZE:=8M}
max_connections                 = ${MARIADB_MAX_CONNECTIONS:=100}
server-id                       = ${MARIADB_SERVER_ID:=1}
innodb_data_home_dir            = /var/lib/mysql
innodb_log_group_home_dir       = /var/lib/mysql
innodb_data_file_path           = ${MARIADB_INNODB_DATA_FILE_PATH:=ibdata1:10M:autoextend}
innodb_buffer_pool_size         = ${MARIADB_INNODB_BUFFER_POOL_SIZE:=16M}
innodb_log_file_size            = ${MARIADB_INNODB_LOG_FILE_SIZE:=5M}
innodb_log_buffer_size          = ${MARIADB_INNODB_LOG_BUFFER_SIZE:=8M}
innodb_flush_log_at_trx_commit  = ${MARIADB_INNODB_FLUSH_LOG_AT_TRX_COMMIT:=1}
innodb_lock_wait_timeout        = ${MARIADB_INNODB_LOCK_WAIT_TIMEOUT:=50}
innodb_use_native_aio           = ${MARIADB_INNODB_USE_NATIVE_AIO:=1}
innodb_file_per_table           = ${MARIADB_INNODB_FILE_PER_TABLE:=1}

[mysqldump]
quick
quote-names
max_allowed_packet              = $MARIADB_MAX_ALLOWED_PACKET

[mysql]
no-auto-rehash

[myisamchk]
key_buffer_size                 = $MARIADB_KEY_BUFFER_SIZE
sort_buffer_size                = $MARIADB_SORT_BUFFER_SIZE
read_buffer                     = ${MARIADB_READ_BUFFER:=2M}
write_buffer                    = ${MARIADB_WRITE_BUFFER:=2M}

[mysqlhotcopy]
interactive-timeout" > /demyx/my.cnf
