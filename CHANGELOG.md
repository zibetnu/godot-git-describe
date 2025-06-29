# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/). This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.7.0] - 2025-06-24

### Added

- Support for macOS. Thanks, [walfie](https://github.com/walfie)!
- "git status" check that pushes an error if something is wrong. This should catch most problems that weren't already accounted for.

## [0.6.0] - 2025-05-28

### Added

- Label that automatically displays the latest Git commit hash.
- Label for displaying the value of a project setting. Acts as a base class for the other labels.
- Automatic project setting with the latest Git commit hash.
- More information in the install instructions.
- Contribution guidelines.

### Changed

- GGD now uses any tags by default, not just annotated tags.

### Fixed

- Error when disabling plugin.

## [0.5.0] - 2025-05-07

### Added

- Extension system to make it easier for users to add custom features.
- Warning when describe strings will affect the user directory's path.

### Fixed

- Removing describe string from project name removes all spaces if the describe was empty.

### Removed

- Support for Godot 4.1.

## [0.4.0] - 2025-04-17

### Added

- Advanced setting to change what options are passed to the describe command.

### Fixed

- Godot 4.2 and earlier push an error on project stop if the append name setting is disabled.

## [0.3.0] - 2025-04-14

### Added

- Option to append the Git description to your project's name.
- Badges in README.md to indicate supported platforms.

## [0.2.1] - 2025-04-12

### Fixed

- Error in Godot 4.2 and earlier.

## [0.2.0] - 2025-04-12

### Added

- Option to change which project setting is set to the Git description.
- Much more information in README.md.

### Changed

- Made changes needed to release on the Godot Asset Library.
- Revised descriptions and documentation comments.
- Refactored a bunch.

## [0.1.0] - 2025-04-08

### Added

- Support for Linux, Steam Linux Runtime, and Windows.
- Addition of a project setting with your Git repository's description when you run or export your project.
- Removal of the describe setting when you stop your project or an export is finished.
- Label that displays the describe setting out of the box.
- Demo scene with a status report.

[0.7.0]: https://github.com/zibetnu/godot-git-describe/compare/0.6.0...0.7.0
[0.6.0]: https://github.com/zibetnu/godot-git-describe/compare/0.5.0...0.6.0
[0.5.0]: https://github.com/zibetnu/godot-git-describe/compare/0.4.0...0.5.0
[0.4.0]: https://github.com/zibetnu/godot-git-describe/compare/0.3.0...0.4.0
[0.3.0]: https://github.com/zibetnu/godot-git-describe/compare/0.2.1...0.3.0
[0.2.1]: https://github.com/zibetnu/godot-git-describe/compare/0.2.0...0.2.1
[0.2.0]: https://github.com/zibetnu/godot-git-describe/compare/0.1.0...0.2.0
[0.1.0]: https://github.com/zibetnu/godot-git-describe/releases/tag/0.1.0
