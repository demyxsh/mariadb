# CHANGELOG

## 2024-02-07
- Merge branch 'master' of github.com:demyxsh/mariadb [db80d4a](https://github.com/demyxsh/mariadb/commit/db80d4abedb2e99be12c7d763027edcd2518173a)
- Update description with shameless plug and support link [daccef3](https://github.com/demyxsh/mariadb/commit/daccef3b4d6ccfa1c29cfef9a1d8b84be8d88f7f)
- Use tail to output actual log file to stdout [8f59940](https://github.com/demyxsh/mariadb/commit/8f599403ff8c67d843fbb2a49af9fac69f191224)
- Generate log file if it doesn't exist [7ee130f](https://github.com/demyxsh/mariadb/commit/7ee130fc2efb39dfb05db00e05840d06168b911c)

## 2023-09-19
- Fix build errors and set alpine version to 3.18 [3f33503](https://github.com/demyxsh/mariadb/commit/3f3350371f94ceece086cfd3ca8db09d7599c90f)

## 2022-05-18
- Fix permission errors [d3df3e6](https://github.com/demyxsh/mariadb/commit/d3df3e6225c43f396c75d94695a3bf65c53a77c3)

## 2021-02-23
- Added
    - `bin/demyx-admin`
    - `bin/demyx-config`
    - `bin/demyx-entrypoint`
    - `bin/demyx-upgrade`
- Changed
    - Renamed src to bin.
    - Renamed admin.sh to demyx-admin.
    - Renamed config.sh to demyx-config.
    - Renamed entrypoint.sh to demyx-entrypoint.
    - Renamed upgrade.sh to demyx-upgrade.
    - `bin/demyx-admin`
        - Remove full paths to binaries.
    - `bin/demyx-config`
        - Remove full paths to binaries.
    - `bin/demyx-entrypoint`
        - Remove full paths to binaries.
        - Add sudo to demyx-admin.
    - `bin/demyx-upgrade`
        - Remove full paths to binaries.
    - `Dockerfile`
        - Remove full paths to binaries.
        - Rearrange RUN commands.
        - Update bash PS1.
        - Update COPY directory.
- Removed

## 2020-12-04
### Changed
- Use full path for entrypoint

## 2020-11-24
### Changed
- Add DEMYX_DOMAIN as a variable

## 2020-11-22
### Changed
- Alphabetized
- Rename variables and support old ones
- Use full paths to binaries/scripts
- Use -E flag for sudo to keep environment variables

## 2020-04-13
### Added
- sudo
- RUN to configure sudo
- Created new folder for source files
### Changed
- Increase max_connections from 100 to 1000
- Fixed formatting in config.sh
- Set dumb-init as the shebang in the entrypoint
- Format LABEL and ENV entries
- Update finalize RUN commands
- Update entrypoint
- Move Updates & Support section to the bottom
- Add notice in Usage section
- Travis-CI
    - Update travis commands
    - Update version commands
    - Output versions to a file
    - Commit version file first before committing the rest
    - Make mariadb container use repository name
    - Misc update to version commands
    - Update WORDPRESS_DB_HOST to repository name
### Removed
