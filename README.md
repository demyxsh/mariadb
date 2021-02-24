# mariadb
[![Build Status](https://img.shields.io/travis/demyxco/mariadb?style=flat)](https://travis-ci.org/demyxco/mariadb)
[![Docker Pulls](https://img.shields.io/docker/pulls/demyx/mariadb?style=flat&color=blue)](https://hub.docker.com/r/demyx/mariadb)
[![Architecture](https://img.shields.io/badge/linux-amd64-important?style=flat&color=blue)](https://hub.docker.com/r/demyx/mariadb)
[![Alpine](https://img.shields.io/badge/alpine-3.13.2-informational?style=flat&color=blue)](https://hub.docker.com/r/demyx/mariadb)
[![MariaDB](https://img.shields.io/badge/mariadb-10.5.8-informational?style=flat&color=blue)](https://hub.docker.com/r/demyx/mariadb)
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
ENTRYPOINT | demyx-entrypoint
TIMEZONE | America/Los_Angeles

## Usage
```
services:
  mariadb:
    container_name: demyx_db
    environment:
      - DEMYX=/demyx
      - DEMYX_CHARACTER_SET_SERVER=utf8
      - DEMYX_COLLATION_SERVER=utf8_general_ci
      - DEMYX_CONFIG=/etc/demyx
      - DEMYX_DATABASE=demyx
      - DEMYX_DEFAULT_CHARACTER_SET=utf8
      - DEMYX_INNODB_BUFFER_POOL_SIZE=16M
      - DEMYX_INNODB_DATA_FILE_PATH=ibdata1:10M:autoextend
      - DEMYX_INNODB_FILE_PER_TABLE=1
      - DEMYX_INNODB_FLUSH_LOG_AT_TRX_COMMIT=1
      - DEMYX_INNODB_LOCK_WAIT_TIMEOUT=50
      - DEMYX_INNODB_LOG_BUFFER_SIZE=8M
      - DEMYX_INNODB_LOG_FILE_SIZE=5M
      - DEMYX_INNODB_USE_NATIVE_AIO=1
      - DEMYX_KEY_BUFFER_SIZE=20M
      - DEMYX_LOG=/var/log/demyx
      - DEMYX_MAX_ALLOWED_PACKET=16M
      - DEMYX_MAX_CONNECTIONS=1000
      - DEMYX_MYISAM_SORT_BUFFER_SIZE=8M
      - DEMYX_NET_BUFFER_SIZE=8K
      - DEMYX_PASSWORD=demyx
      - DEMYX_READ_BUFFER=2M
      - DEMYX_READ_BUFFER_SIZE=256K
      - DEMYX_READ_RND_BUFFER_SIZE=512K
      - DEMYX_ROOT_PASSWORD=demyx_root # mandatory
      - DEMYX_SERVER_ID=1
      - DEMYX_SORT_BUFFER_SIZE=20M
      - DEMYX_TABLE_OPEN_CACHE=64
      - DEMYX_USERNAME=demyx
      - DEMYX_WRITE_BUFFER=2M
      - TZ=America/Los_Angeles
    image: demyx/mariadb
    restart: unless-stopped
    volumes:
      - demyx_db:/demyx
version: "2.4"
volumes:
  demyx_db:
    name: demyx_db
```

## Updates & Support
[![Code Size](https://img.shields.io/github/languages/code-size/demyxco/mariadb?style=flat&color=blue)](https://github.com/demyxco/mariadb)
[![Repository Size](https://img.shields.io/github/repo-size/demyxco/mariadb?style=flat&color=blue)](https://github.com/demyxco/mariadb)
[![Watches](https://img.shields.io/github/watchers/demyxco/mariadb?style=flat&color=blue)](https://github.com/demyxco/mariadb)
[![Stars](https://img.shields.io/github/stars/demyxco/mariadb?style=flat&color=blue)](https://github.com/demyxco/mariadb)
[![Forks](https://img.shields.io/github/forks/demyxco/mariadb?style=flat&color=blue)](https://github.com/demyxco/mariadb)

* Auto built weekly on Saturdays (America/Los_Angeles)
* Rolling release updates
* For support: [#demyx](https://webchat.freenode.net/?channel=#demyx)
