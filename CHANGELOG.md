# Changelog

## 2026-05-11
### Added
- Added InnoDB crash recovery helper script with backup, config override, and guided workflow.
### Changed
- None.
### Fixed
- None.
### Removed
- None.
### Security
- None.

## 2026-05-09
### Added
- None.
### Changed
- Set base image to Alpine 3.22.
- Scheduled build run.
### Fixed
- None.
### Removed
- None.
### Security
- None.

## 2025-07-28
### Added
- Added slow query logging to `demyx-config`.
### Changed
- Updated GitHub Actions workflow to use run ID in scheduled build commit messages.
- Updated environment values and `my.cnf` defaults.
- Allowed users to override `my.cnf`.
- Updated README description/support messaging.
### Fixed
- Added subshell error checking.
- Defined character set and collation when creating a new database.
- Updated log file handling in `demyx-entrypoint`.
### Removed
- Removed deprecated values.
- Removed legacy variable names.
- Removed unnecessary escapes.
### Security
- None.

## 2024-02-07
### Added
- Generated log file automatically if missing.
### Changed
- Updated description with support and project links.
### Fixed
- Used `tail` to stream the actual log file to stdout.
### Removed
- None.
### Security
- None.

## 2023-09-19
### Added
- None.
### Changed
- Set Alpine base version to 3.18.
### Fixed
- Fixed build errors.
### Removed
- None.
### Security
- None.

## 2022-05-18
### Added
- None.
### Changed
- None.
### Fixed
- Fixed permission errors.
### Removed
- None.
### Security
- None.

## 2021-02-23
### Added
- Added `bin/demyx-admin`.
- Added `bin/demyx-config`.
- Added `bin/demyx-entrypoint`.
- Added `bin/demyx-upgrade`.
### Changed
- Renamed `src` to `bin`.
- Renamed `admin.sh` to `demyx-admin`.
- Renamed `config.sh` to `demyx-config`.
- Renamed `entrypoint.sh` to `demyx-entrypoint`.
- Renamed `upgrade.sh` to `demyx-upgrade`.
- Removed full binary paths in `bin/demyx-admin`.
- Removed full binary paths in `bin/demyx-config`.
- Removed full binary paths in `bin/demyx-entrypoint`.
- Added sudo usage to `demyx-admin` calls in `bin/demyx-entrypoint`.
- Removed full binary paths in `bin/demyx-upgrade`.
- Updated `Dockerfile` command/layout flow and `COPY` directory.
- Rearranged `RUN` commands.
- Updated bash `PS1`.
### Fixed
- None.
### Removed
- None.
### Security
- None.

## 2020-12-04
### Added
- None.
### Changed
- Used full path for entrypoint.
### Fixed
- None.
### Removed
- None.
### Security
- None.

## 2020-11-24
### Added
- Added `DEMYX_DOMAIN` variable.
### Changed
- None.
### Fixed
- None.
### Removed
- None.
### Security
- None.

## 2020-11-22
### Added
- None.
### Changed
- Alphabetized variable/config layout.
- Renamed variables and supported old variable names.
- Used full paths to binaries/scripts.
- Used `sudo -E` to keep environment variables.
### Fixed
- None.
### Removed
- None.
### Security
- None.

## 2020-04-13
### Added
- Added `sudo`.
- Added `RUN` step to configure `sudo`.
- Created new folder for source files.
### Changed
- Increased `max_connections` from 100 to 1000.
- Fixed formatting in `config.sh`.
- Set `dumb-init` as shebang in entrypoint.
- Formatted `LABEL` and `ENV` entries.
- Updated final `RUN` commands.
- Updated entrypoint behavior.
- Moved Updates & Support section to the bottom.
- Added notice in Usage section.
- Updated Travis CI commands.
- Updated version commands.
- Output versions to a file.
- Committed version file before other files.
- Updated container naming in CI.
- Updated `WORDPRESS_DB_HOST` to repository name.
### Fixed
- None.
### Removed
- None.
### Security
- None.
