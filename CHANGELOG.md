# CHANGELOG

## 2025-07-28
- Check error for subshells [b8429db](https://github.com/demyxsh/mariadb/commit/b8429dbcda968f92aa05022e15ed245745de0723)
- Define character set and collate when creating a new db [b8e0ac6](https://github.com/demyxsh/mariadb/commit/b8e0ac6b8c499a70a3a59be20813b64d9a8e799b)
- Update ENV and my.cnf [74760e7](https://github.com/demyxsh/mariadb/commit/74760e7bea250e33805bb7cc12bbfa14a5cc354c)
- Remove deprecated values [b9b5495](https://github.com/demyxsh/mariadb/commit/b9b5495e72ce91b40e6f86b18c69b289d6021ee6)
- Check errors in subshells too [f86f058](https://github.com/demyxsh/mariadb/commit/f86f058fc9689eeac8fa4d61e4246b6999a19378)
- Allow users to override my.cnf [14ff401](https://github.com/demyxsh/mariadb/commit/14ff4011700d345fe306b212a2a9dcbe3b9a04c4)
- Remove escapes [bc9dc07](https://github.com/demyxsh/mariadb/commit/bc9dc073c1b57d817a968794849bed2ac653be66)
- Direct people to demyx [87b6a51](https://github.com/demyxsh/mariadb/commit/87b6a51afa8de5d9a2a157773875dc6dbc7764bb)
- Remove old variables [567bd32](https://github.com/demyxsh/mariadb/commit/567bd32c27dba0ff5f22ad459ff807753d6ce33e)
- Add slow query logging to demyx-config and update log file handling in demyx-entrypoint [4900df0](https://github.com/demyxsh/mariadb/commit/4900df0cd60cfea5d1fd95c196f508f994552e89)
- Update GitHub Actions workflow to use run ID in commit message for scheduled builds [c174ea5](https://github.com/demyxsh/mariadb/commit/c174ea5d69bf368ca3d7df91504760cdcf13dffb)

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
