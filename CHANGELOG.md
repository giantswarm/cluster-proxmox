# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed

- Updated `cert-manager` to v4.0.0 and migrated the values to match the new chart's schema.

## [1.1.0] - 2026-06-19

### Changed

- Update `giantswarm/cluster` to v6.7.0.

## [1.0.1] - 2026-06-15

### Changed

> [!TIP]
> This release is not compatible with `cluster-api-provider-proxmox-app` releases prior to [v0.4.0](https://github.com/giantswarm/cluster-api-provider-proxmox-app/releases/tag/v0.4.0)

- Apply migrations required by [upstream provider release v0.8.0](https://github.com/ionos-cloud/cluster-api-provider-proxmox/releases/tag/v0.8.0).
- Update IPAddressClaim API versions to v1beta2.
- Update `giantswarm/cluster` to v6.4.0.
- Update Proxmox app icon to `https://s.giantswarm.io/app-icons/proxmox/2/light.svg`.

## [1.0.0] - 2026-03-30

### Changed

- Use tags instead of template ID to select flatcar template.
- General all-round updates to align with other provider charts.
- Update `giantswarm/cluster` to v6.1.0.
- Update `giantswarm/cluster` to v6.3.0.

### Fixed

- Correct kube-vip static pod manifest to align with 0.9.0 release.

## [0.1.0] - 2025-02-21

### Added

- Integration of `giantswarm/cluster` (with releases disabled).
- Add `cloud-provider-proxmox` as a HelmRelease.

### Changed

- Initial commit of chart.
- Add required values to pass schema validation.

[Unreleased]: https://github.com/giantswarm/cluster-proxmox/compare/v1.1.0...HEAD
[1.1.0]: https://github.com/giantswarm/cluster-proxmox/compare/v1.0.1...v1.1.0
[1.0.1]: https://github.com/giantswarm/cluster-proxmox/compare/v1.0.0...v1.0.1
[1.0.0]: https://github.com/giantswarm/cluster-proxmox/compare/v0.1.0...v1.0.0
[0.1.0]: https://github.com/giantswarm/cluster-proxmox/releases/tag/v0.1.0
