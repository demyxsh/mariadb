# mariadb
[![Build Status](https://img.shields.io/travis/demyxco/mariadb?style=flat)](https://travis-ci.org/demyxco/mariadb)
[![Docker Pulls](https://img.shields.io/docker/pulls/demyx/mariadb?style=flat&color=blue)](https://hub.docker.com/r/demyx/mariadb)
[![Architecture](https://img.shields.io/badge/linux-amd64-important?style=flat&color=blue)](https://hub.docker.com/r/demyx/mariadb)
[![Alpine](https://img.shields.io/badge/alpine-3.11.6-informational?style=flat&color=blue)](https://hub.docker.com/r/demyx/mariadb)
[![MariaDB](https://img.shields.io/badge/mariadb-10.4.12-informational?style=flat&color=blue)](https://hub.docker.com/r/demyx/mariadb)
[![Buy Me A Coffee](https://img.shields.io/badge/buy_me_coffee-$5-informational?style=flat&color=blue)](https://www.buymeacoffee.com/VXqkQK5tb)
[![Become a Patron!](https://img.shields.io/badge/become%20a%20patron-$5-informational?style=flat&color=blue)](https://www.patreon.com/bePatron?u=23406156)

Non-root Docker image running Alpine Linux and MariaDB.

DEMYX | MARIADB
--- | ---
TAGS | latest edge
PORT | 3306
USER | demyx
WORKDIR | /demyx
CONFIG | /etc/demyx
ENTRYPOINT | ["demyx-entrypoint"]
TIMEZONE | America/Los_Angeles

## Usage
```
version: "3.7"

services:
  mariadb:
    container_name: demyx_mariadb
    image: demyx/mariadb
    restart: unless-stopped
    environment:
      - MARIADB_DATABASE=demyx_db
      - MARIADB_USERNAME=demyx_user
      - MARIADB_PASSWORD=demyx_password
      - MARIADB_ROOT_PASSWORD=demyx_root_password # mandatory
      - MARIADB_ROOT=/demyx
      - MARIADB_CONFIG=/etc/demyx
      - MARIADB_LOG=/var/log/demyx
      - MARIADB_CHARACTER_SET_SERVER=utf8
      - MARIADB_COLLATION_SERVER=utf8_general_ci
      - MARIADB_DEFAULT_CHARACTER_SET=utf8
      - MARIADB_INNODB_BUFFER_POOL_SIZE=16M
      - MARIADB_INNODB_DATA_FILE_PATH=ibdata1:10M:autoextend
      - MARIADB_INNODB_FLUSH_LOG_AT_TRX_COMMIT=1
      - MARIADB_INNODB_LOCK_WAIT_TIMEOUT=50
      - MARIADB_INNODB_LOG_BUFFER_SIZE=8M
      - MARIADB_INNODB_LOG_FILE_SIZE=5M
      - MARIADB_INNODB_USE_NATIVE_AIO=1
      - MARIADB_INNODB_FILE_PER_TABLE=1
      - MARIADB_KEY_BUFFER_SIZE=20M
      - MARIADB_MAX_ALLOWED_PACKET=16M
      - MARIADB_MAX_CONNECTIONS=1000
      - MARIADB_MYISAM_SORT_BUFFER_SIZE=8M
      - MARIADB_NET_BUFFER_SIZE=8K
      - MARIADB_READ_BUFFER=2M
      - MARIADB_READ_BUFFER_SIZE=256K
      - MARIADB_READ_RND_BUFFER_SIZE=512K
      - MARIADB_SERVER_ID=1
      - MARIADB_SORT_BUFFER_SIZE=20M
      - MARIADB_TABLE_OPEN_CACHE=64
      - MARIADB_WRITE_BUFFER=2M
      - TZ=America/Los_Angeles
    volumes:
      - demyx_mariadb:/demyx
volumes:
  demyx_mariadb:
    name: demyx_mariadb
```

## Updates & Support
[![Code Size](https://img.shields.io/github/languages/code-size/demyxco/mariadb?style=flat&color=blue)](https://github.com/demyxco/mariadb)
[![Repository Size](https://img.shields.io/github/repo-size/demyxco/mariadb?style=flat&color=blue)](https://github.com/demyxco/mariadb)
[![Watches](https://img.shields.io/github/watchers/demyxco/mariadb?style=flat&color=blue)](https://github.com/demyxco/mariadb)
[![Stars](https://img.shields.io/github/stars/demyxco/mariadb?style=flat&color=blue)](https://github.com/demyxco/mariadb)
[![Forks](https://img.shields.io/github/forks/demyxco/mariadb?style=flat&color=blue)](https://github.com/demyxco/mariadb)

* Auto built weekly on Sundays (America/Los_Angeles)
* Rolling release updates
* For support: [#demyx](https://webchat.freenode.net/?channel=#demyx)
