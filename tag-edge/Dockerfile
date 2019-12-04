FROM alpine

LABEL sh.demyx.image demyx/mariadb
LABEL sh.demyx.maintainer Demyx <info@demyx.sh>
LABEL sh.demyx.url https://demyx.sh
LABEL sh.demyx.github https://github.com/demyxco
LABEL sh.demyx.registry https://hub.docker.com/u/demyx

# Set default environment variable
ENV TZ=America/Los_Angeles

# Packages
RUN set -ex; \
    apk add --no-cache --update dumb-init mariadb mariadb-client tzdata
    
# Create demyx user
RUN set -ex; \
    addgroup -g 1000 -S demyx; \
    adduser -u 1000 -D -S -G demyx demyx

# Set up mariadb
RUN set -ex; \
    install -d -m 0755 -o demyx -g demyx /var/lib/mysql; \
    install -d -m 0755 -o demyx -g demyx /var/log/demyx; \
    install -d -m 0755 -o demyx -g demyx /demyx; \
    \
    ln -sf /demyx/my.cnf /etc/my.cnf

# Copy files
COPY demyx.sh /usr/local/bin/demyx
COPY config.sh /usr/local/bin/demyx-config
COPY upgrade.sh /usr/local/bin/demyx-upgrade

# Finalize
RUN set -ex; \
    chmod +x /usr/local/bin/demyx; \
    chmod +x /usr/local/bin/demyx-config; \
    chmod +x /usr/local/bin/demyx-upgrade

WORKDIR /var/lib/mysql

EXPOSE 3306

USER demyx

ENTRYPOINT ["dumb-init", "demyx"]
