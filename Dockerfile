FROM alpine:3.18

LABEL sh.demyx.image                        demyx/mariadb
LABEL sh.demyx.maintainer                   Demyx <info@demyx.sh>
LABEL sh.demyx.url                          https://demyx.sh
LABEL sh.demyx.github                       https://github.com/demyxsh
LABEL sh.demyx.registry                     https://hub.docker.com/u/demyx

# Set default variables
ENV DEMYX                                   /demyx
ENV DEMYX_CHARACTER_SET_SERVER              utf8mb4
ENV DEMYX_COLLATION_SERVER                  utf8mb4_unicode_520_ci
ENV DEMYX_CONFIG                            /etc/demyx
ENV DEMYX_DATABASE                          demyx
ENV DEMYX_DEFAULT_CHARACTER_SET             utf8mb4
ENV DEMYX_DOMAIN                            localhost
ENV DEMYX_INNODB_BUFFER_POOL_SIZE           4G
ENV DEMYX_INNODB_CHANGE_BUFFERING           all
ENV DEMYX_INNODB_CHECKSUM_ALGORITHM         crc32
ENV DEMYX_INNODB_DATA_FILE_PATH             ibdata1:10M:autoextend
ENV DEMYX_INNODB_FILE_PER_TABLE             1
ENV DEMYX_INNODB_FLUSH_LOG_AT_TRX_COMMIT    0
ENV DEMYX_INNODB_IO_CAPACITY                2000
ENV DEMYX_INNODB_IO_CAPACITY_MAX            5000
ENV DEMYX_INNODB_LOCK_WAIT_TIMEOUT          50
ENV DEMYX_INNODB_LOG_BUFFER_SIZE            512M
ENV DEMYX_INNODB_LOG_FILE_SIZE              512M
ENV DEMYX_INNODB_USE_NATIVE_AIO             1
ENV DEMYX_KEY_BUFFER_SIZE                   20M
ENV DEMYX_LOG                               /var/log/demyx
ENV DEMYX_MAX_ALLOWED_PACKET                16M
ENV DEMYX_MAX_CONNECTIONS                   1000
ENV DEMYX_MYISAM_SORT_BUFFER_SIZE           8M
ENV DEMYX_NET_BUFFER_SIZE                   8K
ENV DEMYX_PASSWORD                          demyx
ENV DEMYX_PERFORMANCE_SCHEMA                0
ENV DEMYX_QUERY_CACHE_LIMIT                 128K
ENV DEMYX_QUERY_CACHE_MIN_RES_UNIT          512
ENV DEMYX_QUERY_CACHE_SIZE                  64M
ENV DEMYX_QUERY_CACHE_TYPE                  1
ENV DEMYX_READ_BUFFER                       2M
ENV DEMYX_READ_BUFFER_SIZE                  256K
ENV DEMYX_READ_RND_BUFFER_SIZE              512K
ENV DEMYX_ROOT_PASSWORD                     demyx_root
ENV DEMYX_SERVER_ID                         1
ENV DEMYX_SORT_BUFFER_SIZE                  20M
ENV DEMYX_SQL_MODE                          NO_ENGINE_SUBSTITUTION
ENV DEMYX_TABLE_OPEN_CACHE                  64
ENV DEMYX_USERNAME                          demyx
ENV DEMYX_WRITE_BUFFER                      2M
ENV TZ                                      America/Los_Angeles
# Support for old variables
ENV MARIADB_ROOT                            "$DEMYX"
ENV MARIADB_CONFIG                          "$DEMYX_CONFIG"
ENV MARIADB_LOG                             "$DEMYX_LOG"

# Packages
RUN set -ex; \
    apk --update --no-cache add bash mariadb mariadb-client sudo tzdata

# Configure Demyx
RUN set -ex; \
    # Create demyx user
    addgroup -g 1000 -S demyx; \
    adduser -u 1000 -D -S -G demyx demyx; \
    \
    # Create demyx directories
    install -d -m 0755 -o demyx -g demyx "$DEMYX"; \
    install -d -m 0755 -o demyx -g demyx "$DEMYX_CONFIG"; \
    install -d -m 0755 -o demyx -g demyx "$DEMYX_LOG"; \
    \
    # Update .bashrc
    echo 'PS1="$(whoami)@\h:\w \$ "' > /home/demyx/.bashrc; \
    echo 'PS1="$(whoami)@\h:\w \$ "' > /root/.bashrc

# Configure sudo
RUN set -ex; \
    echo "demyx ALL=(ALL) NOPASSWD:SETENV: /usr/local/bin/demyx-admin" > /etc/sudoers.d/demyx

# Imports
COPY --chown=root:root bin /usr/local/bin

# Finalize
RUN set -ex; \
    # Symlink config
    ln -sf "$DEMYX_CONFIG"/my.cnf /etc/my.cnf; \
    \
    # Set ownership
    chown -R root:root /usr/local/bin; \
    chown -R demyx:demyx /tmp

WORKDIR "$DEMYX"

EXPOSE 3306

USER demyx

ENTRYPOINT ["demyx-entrypoint"]
