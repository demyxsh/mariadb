FROM alpine

LABEL sh.demyx.image        demyx/mariadb
LABEL sh.demyx.maintainer   Demyx <info@demyx.sh>
LABEL sh.demyx.url          https://demyx.sh
LABEL sh.demyx.github       https://github.com/demyxco
LABEL sh.demyx.registry     https://hub.docker.com/u/demyx

# Set default variables
ENV MARIADB_ROOT    /demyx
ENV MARIADB_CONFIG  /etc/demyx
ENV MARIADB_LOG     /var/log/demyx
ENV TZ              America/Los_Angeles

# Configure Demyx
RUN set -ex; \
    addgroup -g 1000 -S demyx; \
    adduser -u 1000 -D -S -G demyx demyx; \
    \
    install -d -m 0755 -o demyx -g demyx "$MARIADB_ROOT"; \
    install -d -m 0755 -o demyx -g demyx "$MARIADB_CONFIG"; \
    install -d -m 0755 -o demyx -g demyx "$MARIADB_LOG"

# Packages
RUN set -ex; \
    apk add --no-cache --update bash dumb-init mariadb mariadb-client sudo tzdata

# Copy files
COPY --chown=demyx:demyx src "$MARIADB_CONFIG"

# Configure sudo
RUN set -ex; \
    echo "demyx ALL=(ALL) NOPASSWD:/etc/demyx/admin.sh" > /etc/sudoers.d/demyx; \
    \
    echo 'Defaults env_keep +="MARIADB_ROOT"' >> /etc/sudoers.d/demyx; \
    echo 'Defaults env_keep +="MARIADB_ROOT_PASSWORD"' >> /etc/sudoers.d/demyx; \
    echo 'Defaults env_keep +="MARIADB_DATABASE"' >> /etc/sudoers.d/demyx; \
    echo 'Defaults env_keep +="MARIADB_USERNAME"' >> /etc/sudoers.d/demyx; \
    echo 'Defaults env_keep +="MARIADB_PASSWORD"' >> /etc/sudoers.d/demyx; \
    \
    echo '#!/bin/bash' > /usr/local/bin/demyx-admin; \
    echo 'sudo /etc/demyx/admin.sh' >> /usr/local/bin/demyx-admin; \
    chmod +x "$MARIADB_CONFIG"/admin.sh; \
    chmod +x /usr/local/bin/demyx-admin

# Finalize
RUN set -ex; \
    # demyx-config
    chmod +x "$MARIADB_CONFIG"/config.sh; \
    mv "$MARIADB_CONFIG"/config.sh /usr/local/bin/demyx-config; \
    \
    # demyx-upgrade
    chmod +x "$MARIADB_CONFIG"/upgrade.sh; \
    mv "$MARIADB_CONFIG"/upgrade.sh /usr/local/bin/demyx-upgrade; \
    \
    # demyx-entrypoint
    chmod +x "$MARIADB_CONFIG"/entrypoint.sh; \
    mv "$MARIADB_CONFIG"/entrypoint.sh /usr/local/bin/demyx-entrypoint; \
    \
    # Symlink config
    ln -sf "$MARIADB_CONFIG"/my.cnf /etc/my.cnf; \
    \
    # Reset permissions
    chown -R root:root /usr/local/bin

WORKDIR "$MARIADB_ROOT"

EXPOSE 3306

USER demyx

ENTRYPOINT ["dumb-init", "demyx"]
