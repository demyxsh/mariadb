FROM alpine

LABEL sh.demyx.image demyx/mariadb
LABEL sh.demyx.maintainer Demyx <info@demyx.sh>
LABEL sh.demyx.url https://demyx.sh
LABEL sh.demyx.github https://github.com/demyxco
LABEL sh.demyx.registry https://hub.docker.com/u/demyx

# Set default variables
ENV MARIADB_ROOT=/demyx
ENV MARIADB_CONFIG=/etc/demyx
ENV MARIADB_LOG=/var/log/demyx
ENV TZ America/Los_Angeles

# Packages
RUN set -ex; \
    apk add --no-cache --update bash dumb-init mariadb mariadb-client tzdata
    
# Create demyx user
RUN set -ex; \
    addgroup -g 1000 -S demyx; \
    adduser -u 1000 -D -S -G demyx demyx

# Set up mariadb
RUN set -ex; \
    install -d -m 0755 -o demyx -g demyx "$MARIADB_ROOT"; \
    install -d -m 0755 -o demyx -g demyx "$MARIADB_CONFIG"; \
    install -d -m 0755 -o demyx -g demyx "$MARIADB_LOG"; \
    \
    ln -sf "$MARIADB_CONFIG"/my.cnf /etc/my.cnf

# Copy files
COPY demyx.sh /usr/local/bin/demyx
COPY config.sh /usr/local/bin/demyx-config
COPY upgrade.sh /usr/local/bin/demyx-upgrade

# Finalize
RUN set -ex; \
    chmod +x /usr/local/bin/demyx; \
    chmod +x /usr/local/bin/demyx-config; \
    chmod +x /usr/local/bin/demyx-upgrade

WORKDIR "$MARIADB_ROOT"

EXPOSE 3306

USER demyx

ENTRYPOINT ["dumb-init", "demyx"]
