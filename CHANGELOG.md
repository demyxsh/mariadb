# CHANGELOG

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
