# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed
- Strengthened `dev-co-pilot` for senior frontend, backend, and full-stack work:
  frontend delivery, backend delivery, API-contract safety, and proportional
  verification now have dedicated on-demand references.
- Replaced the unconditional plan-confirmation gate with a scope-aware rule so
  clear implementation requests can proceed while material business or public
  contract decisions still stop for confirmation.
- Converted the repository to the Claude Code Skill layout: `.claude/skills/dev-co-pilot`.
- Updated the installers and documentation for Claude Code and CCSwitch; the previous platform-specific paths are no longer supported.

### Added
- Initial skill scaffold: `SKILL.md` + 13 reference scenario files + maintenance register asset.
- Cross-platform install scripts: `install.sh` (macOS/Linux), `install.ps1` (Windows).
- User-scope and project-scope installation modes.
