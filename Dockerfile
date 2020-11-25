FROM alpine

LABEL sh.demyx.image                        demyx/mariadb
LABEL sh.demyx.maintainer                   Demyx <info@demyx.sh>
LABEL sh.demyx.url                          https://demyx.sh
LABEL sh.demyx.github                       https://github.com/demyxco
LABEL sh.demyx.registry                     https://hub.docker.com/u/demyx

# Set default variables
ENV DEMYX                                   /demyx
ENV DEMYX_CHARACTER_SET_SERVER              utf8
ENV DEMYX_COLLATION_SERVER                  utf8_general_ci
ENV DEMYX_CONFIG                            /etc/demyx
ENV DEMYX_DATABASE                          demyx
ENV DEMYX_DEFAULT_CHARACTER_SET             utf8
ENV DEMYX_DOMAIN                            localhost
ENV DEMYX_INNODB_BUFFER_POOL_SIZE           16M
ENV DEMYX_INNODB_DATA_FILE_PATH             ibdata1:10M:autoextend
ENV DEMYX_INNODB_FILE_PER_TABLE             1
ENV DEMYX_INNODB_FLUSH_LOG_AT_TRX_COMMIT    1
ENV DEMYX_INNODB_LOCK_WAIT_TIMEOUT          50
ENV DEMYX_INNODB_LOG_BUFFER_SIZE            8M
ENV DEMYX_INNODB_LOG_FILE_SIZE              5M
ENV DEMYX_INNODB_USE_NATIVE_AIO             1
ENV DEMYX_KEY_BUFFER_SIZE                   20M
ENV DEMYX_LOG                               /var/log/demyx
ENV DEMYX_MAX_ALLOWED_PACKET                16M
ENV DEMYX_MAX_CONNECTIONS                   1000
ENV DEMYX_MYISAM_SORT_BUFFER_SIZE           8M
ENV DEMYX_NET_BUFFER_SIZE                   8K
ENV DEMYX_PASSWORD                          demyx
ENV DEMYX_READ_BUFFER                       2M
ENV DEMYX_READ_BUFFER_SIZE                  256K
ENV DEMYX_READ_RND_BUFFER_SIZE              512K
ENV DEMYX_ROOT_PASSWORD                     demyx_root
ENV DEMYX_SERVER_ID                         1
ENV DEMYX_SORT_BUFFER_SIZE                  20M
ENV DEMYX_TABLE_OPEN_CACHE                  64
ENV DEMYX_USERNAME                          demyx
ENV DEMYX_WRITE_BUFFER                      2M
ENV TZ                                      America/Los_Angeles
# Support for old variables
ENV MARIADB_ROOT                            "$DEMYX"
ENV MARIADB_CONFIG                          "$DEMYX_CONFIG"
ENV MARIADB_LOG                             "$DEMYX_LOG"

# Configure Demyx
RUN set -ex; \
    /usr/sbin/addgroup -g 1000 -S demyx; \
    /usr/sbin/adduser -u 1000 -D -S -G demyx demyx; \
    \
    /usr/bin/install -d -m 0755 -o demyx -g demyx "$DEMYX"; \
    /usr/bin/install -d -m 0755 -o demyx -g demyx "$DEMYX_CONFIG"; \
    /usr/bin/install -d -m 0755 -o demyx -g demyx "$DEMYX_LOG"

# Packages
RUN set -ex; \
    /sbin/apk --update --no-cache add bash mariadb mariadb-client sudo tzdata

# Configure sudo
RUN set -ex; \
    /bin/echo "demyx ALL=(ALL) NOPASSWD:SETENV: /etc/demyx/admin.sh" > /etc/sudoers.d/demyx

# Imports
COPY --chown=demyx:demyx src "$DEMYX_CONFIG"

# Finalize
RUN set -ex; \
    # demyx-admin
    /bin/echo '#!/bin/bash' > /usr/local/bin/demyx-admin; \
    /bin/echo '/usr/bin/sudo -E /etc/demyx/admin.sh' >> /usr/local/bin/demyx-admin; \
    /bin/chmod +x "$DEMYX_CONFIG"/admin.sh; \
    /bin/chmod +x /usr/local/bin/demyx-admin; \
    \
    # demyx-config
    /bin/cp "$DEMYX_CONFIG"/config.sh /usr/local/bin/demyx-config; \
    /bin/chmod +x /usr/local/bin/demyx-config; \
    \
    # demyx-upgrade
    /bin/cp "$DEMYX_CONFIG"/upgrade.sh /usr/local/bin/demyx-upgrade; \
    /bin/chmod +x /usr/local/bin/demyx-upgrade; \
    \
    # demyx-entrypoint
    /bin/cp "$DEMYX_CONFIG"/entrypoint.sh /usr/local/bin/demyx-entrypoint; \
    /bin/chmod +x /usr/local/bin/demyx-entrypoint; \
    \
    # Symlink config
    /bin/ln -sf "$DEMYX_CONFIG"/my.cnf /etc/my.cnf; \
    \
    # Reset permissions
    /bin/chown -R root:root /usr/local/bin

WORKDIR "$DEMYX"

EXPOSE 3306

USER demyx

ENTRYPOINT ["demyx-entrypoint"]
