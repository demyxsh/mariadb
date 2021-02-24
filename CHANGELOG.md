# CHANGELOG

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
