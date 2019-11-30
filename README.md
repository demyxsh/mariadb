# mariadb
[![Build Status](https://img.shields.io/travis/demyxco/mariadb?style=flat)](https://travis-ci.org/demyxco/mariadb)
[![Docker Pulls](https://img.shields.io/docker/pulls/demyx/mariadb?style=flat&color=blue)](https://hub.docker.com/r/demyx/mariadb)
[![Architecture](https://img.shields.io/badge/linux-amd64-important?style=flat&color=blue)](https://hub.docker.com/r/demyx/mariadb)
[![Alpine](https://img.shields.io/badge/alpine-3.11_alpha20190925-informational?style=flat&color=blue)](https://hub.docker.com/r/demyx/mariadb)
[![MariaDB](https://img.shields.io/badge/mariadb-10.4.8-informational?style=flat&color=blue)](https://hub.docker.com/r/demyx/mariadb)
[![Buy Me A Coffee](https://img.shields.io/badge/buy_me_coffee-$5-informational?style=flat&color=blue)](https://www.buymeacoffee.com/VXqkQK5tb)

MariaDB is a community-developed fork of the MySQL relational database management system intended to remain free under the GNU GPL. Development is led by some of the original developers of MySQL, who forked it due to concerns over its acquisition by Oracle Corporation. Contributors are required to share their copyright with the MariaDB Foundation.

TITLE | DESCRIPTION
--- | ---
TAGS | latest edge
USER<br />GROUP | demyx (1000)<br />demyx (1000)
WORKDIR | /var/lib/mysql
ENTRYPOINT | ["dumb-init", "demyx"]
PORT | 3306
TIMEZONE | America/Los_Angeles

## Notice
`demyx/mariadb:edge` will be merged with `demyx/mariadb:latest` on January 1st, 2020. Edge now runs as demyx user and not as root. There is an upgrade script included because this image will break when using the latest tag. If you want to keep using the current MariaDB setup, then please switch your containers' images to `webhippie/mariadb:latest`.

### PLEASE BACKUP FIRST BECAUSE THIS WILL DELETE EVERYTHING INSIDE /var/lib/mysql!

To upgrade, you must include all four environment variables

```
docker run -it --rm --name=mariadb \
-v mariadb:/var/lib/mysql \
-e MARIADB_ROOT_PASSWORD=your-root-password \
-e MARIADB_DATABASE=your-database \
-e MARIADB_USERNAME=your-username \
-e MARIADB_PASSWORD=your-password \
--entrypoint=demyx-upgrade \
demyx/mariadb:edge
```

After that, restart the container using the new image: `demyx/mariadb:edge`. This notice will be removed once the merge is complete.

## Updates & Support
[![Code Size](https://img.shields.io/github/languages/code-size/demyxco/mariadb?style=flat&color=blue)](https://github.com/demyxco/mariadb)
[![Repository Size](https://img.shields.io/github/repo-size/demyxco/mariadb?style=flat&color=blue)](https://github.com/demyxco/mariadb)
[![Watches](https://img.shields.io/github/watchers/demyxco/mariadb?style=flat&color=blue)](https://github.com/demyxco/mariadb)
[![Stars](https://img.shields.io/github/stars/demyxco/mariadb?style=flat&color=blue)](https://github.com/demyxco/mariadb)
[![Forks](https://img.shields.io/github/forks/demyxco/mariadb?style=flat&color=blue)](https://github.com/demyxco/mariadb)

* Auto built weekly on Sundays (America/Los_Angeles)
* Rolling release updates
* For support: [#demyx](https://webchat.freenode.net/?channel=#demyx)

## Usage
```
version: "3.7"

services:
  mariadb:
    container_name: demyx_mariadb
    image: demyx/mariadb:edge
    restart: unless-stopped
    environment:
      - MARIADB_DATABASE=demyx_db
      - MARIADB_USERNAME=demyx_user
      - MARIADB_PASSWORD=demyx_password
      - MARIADB_ROOT_PASSWORD=demyx_root_password # mandatory
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
      - MARIADB_MAX_CONNECTIONS=100
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
      - demyx_mariadb:/var/lib/mysql
volumes:
  demyx_mariadb:
    name: demyx_mariadb
```
