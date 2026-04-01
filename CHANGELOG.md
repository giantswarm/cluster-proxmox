# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed

- Set CCM network mode to `auto` to collect node IP from both qemu and kubelet flags.

## [1.0.0] - 2026-03-30

### Changed

- Use tags instead of template ID to select flatcar template.
- General all-round updates to align with other provider charts.
- Update `giantswarm/cluster` to v6.1.0.

### Fixed

- Correct kube-vip static pod manifest to align with 0.9.0 release.

## [0.1.0] - 2025-02-21

### Added

- Integration of `giantswarm/cluster` (with releases disabled).
- Add `cloud-provider-proxmox` as a HelmRelease.

### Changed

- Initial commit of chart.
- Add required values to pass schema validation.

[Unreleased]: https://github.com/giantswarm/cluster-proxmox/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/giantswarm/cluster-proxmox/compare/v0.1.0...v1.0.0
[0.1.0]: https://github.com/giantswarm/cluster-proxmox/releases/tag/v0.1.0
