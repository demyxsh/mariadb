# mariadb
[![Build Status](https://img.shields.io/travis/demyxco/mariadb?style=flat)](https://travis-ci.org/demyxco/mariadb)
[![Docker Pulls](https://img.shields.io/docker/pulls/demyx/mariadb?style=flat&color=blue)](https://hub.docker.com/r/demyx/mariadb)
[![Architecture](https://img.shields.io/badge/linux-amd64-important?style=flat&color=blue)](https://hub.docker.com/r/demyx/mariadb)
[![Alpine](https://img.shields.io/badge/alpine-3.10_alpha20190408-informational?style=flat&color=blue)](https://hub.docker.com/r/demyx/mariadb)
[![MariaDB](https://img.shields.io/badge/mariadb-10.3.15-informational?style=flat&color=blue)](https://hub.docker.com/r/demyx/mariadb)

MariaDB is a community-developed fork of the MySQL relational database management system intended to remain free under the GNU GPL. Development is led by some of the original developers of MySQL, who forked it due to concerns over its acquisition by Oracle Corporation. Contributors are required to share their copyright with the MariaDB Foundation. Image is built from `webhippie/mariadb:latest`.

TITLE | DESCRIPTION
--- | ---
PORT | 3306
TIMEZONE | America/Los_Angeles

# Updates
[![Code Size](https://img.shields.io/github/languages/code-size/demyxco/mariadb?style=flat&color=blue)](https://github.com/demyxco/mariadb)
[![Repository Size](https://img.shields.io/github/repo-size/demyxco/mariadb?style=flat&color=blue)](https://github.com/demyxco/mariadb)
[![Watches](https://img.shields.io/github/watchers/demyxco/mariadb?style=flat&color=blue)](https://github.com/demyxco/mariadb)
[![Stars](https://img.shields.io/github/stars/demyxco/mariadb?style=flat&color=blue)](https://github.com/demyxco/mariadb)
[![Forks](https://img.shields.io/github/forks/demyxco/mariadb?style=flat&color=blue)](https://github.com/demyxco/mariadb)

* Auto built weekly on Sundays (America/Los_Angeles)
* Rolling release updates

# Usage
```
mariadb:
    container_name: mariadb
    image: demyx/mariadb
    restart: unless-stopped
    environment:
      MARIADB_DATABASE: demyx_db
      MARIADB_USERNAME: demyx_user
      MARIADB_PASSWORD: demyx_password
      MARIADB_ROOT_PASSWORD: demyx_root_password # mandatory
      MARIADB_DEFAULT_CHARACTER_SET: utf8
      MARIADB_CHARACTER_SET_SERVER: utf8
      MARIADB_COLLATION_SERVER: utf8_general_ci
      MARIADB_KEY_BUFFER_SIZE: 32M
      MARIADB_MAX_ALLOWED_PACKET: 16M
      MARIADB_TABLE_OPEN_CACHE: 2000
      MARIADB_SORT_BUFFER_SIZE: 4M
      MARIADB_NET_BUFFER_SIZE: 4M
      MARIADB_READ_BUFFER_SIZE: 2M
      MARIADB_READ_RND_BUFFER_SIZE: 1M
      MARIADB_MYISAM_SORT_BUFFER_SIZE: 32M
      MARIADB_LOG_BIN: mysql-bin
      MARIADB_BINLOG_FORMAT: mixed
      MARIADB_SERVER_ID: 1
      MARIADB_INNODB_DATA_FILE_PATH: ibdata1:10M:autoextend
      MARIADB_INNODB_BUFFER_POOL_SIZE: 32M
      MARIADB_INNODB_LOG_FILE_SIZE: 5M
      MARIADB_INNODB_LOG_BUFFER_SIZE: 8M
      MARIADB_INNODB_FLUSH_LOG_AT_TRX_COMMIT: 1
      MARIADB_INNODB_LOCK_WAIT_TIMEOUT: 50
      MARIADB_INNODB_USE_NATIVE_AIO: 1
      MARIADB_READ_BUFFER: 2M
      MARIADB_WRITE_BUFFER: 2M
      MARIADB_MAX_CONNECTIONS: 100
      TZ: America/Los_Angeles
    volumes:
      - ./db:/var/lib/mysql
```