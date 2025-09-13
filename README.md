<h1 align="center">Godot Git Describe</h1>
<p align="center">
  <img src="./git_describe_demo/icon.svg", width=30%>
</p>

<p align="center">
  <a href="https://godotengine.org/download/" target="_blank">
    <img alt="Godot v4.2+" src="https://img.shields.io/badge/Godot_v4.2+-478cbf?logo=godotengine&logoColor=ffffff&style=for-the-badge" />
  </a>
  <a href="LICENSE">
    <img alt="License" src="https://img.shields.io/github/license/zibetnu/godot-git-describe?labelColor=1c1c1e&style=for-the-badge&color=8eef97">
  </a>
  <a href="https://github.com/zibetnu/godot-git-describe/releases">
    <img alt="Latest Release" src="https://img.shields.io/github/v/release/zibetnu/godot-git-describe?include_prereleases&labelColor=1c1c1e&style=for-the-badge&color=ef476f">
  </a>
</p>

<p align="center">
  <img alt="Linux" src="https://img.shields.io/badge/Linux-fcc624?style=flat-square&logo=linux&logoColor=1c1c1e">
  <img alt="macOS" src="https://img.shields.io/badge/macOS-1c1c1e?style=flat-square&logo=apple">
  <img alt="Steam Linux Runtime" src="https://img.shields.io/badge/Steam_Linux_Runtime-171d25?style=flat-square&logo=steam">
  <img alt="Windows" src="https://img.shields.io/badge/Windows-0067b8?style=flat-square">
</p>

Do you use [tags](https://git-scm.com/book/en/v2/Git-Basics-Tagging) to label your project's releases? Do you want to display those labels in your project without manually setting a separate value?

You've come to the right place.

## Features

- Adds your Git repository's [description](https://git-scm.com/docs/git-describe) to your project on run or export.
- Reverts changes when you stop your project or an export is finished.
- Batteries included: comes with nodes and settings that cover common use cases.

## Limitations

GGD relies on Godot's export process. Workflows without that export process may instead benefit from [Git export substitution](https://git-scm.com/docs/gitattributes#_export_subst). See [.gitattributes](./.gitattributes) and [plugin.cfg](./addons/git_describe/plugin.cfg) for an example of this in action.

## Installation

1. Use Godot to download GGD from the [Asset Library](https://godotengine.org/asset-library/asset/3931) (recommended) or get the latest [GitHub release](https://github.com/zibetnu/godot-git-describe/releases).
2. Enable GGD in the project settings.

See the Godot docs for [detailed instructions](https://docs.godotengine.org/en/stable/tutorials/plugins/editor/installing_plugins.html) if needed.

> [!NOTE]
> GGD uses Godot 4.4's UID system. Godot 4.3 and earlier will adjust the UIDs after printing a warning on the first run.

## Usage

1. Add a [tag](https://git-scm.com/book/en/v2/Git-Basics-Tagging) to your Git repo.
2. Add included nodes and adjust project settings as desired.
3. Run or export the project.

> [!TIP]
> For best results, do not commit automatic changes to version control.

### Nodes

| Name | Description |
| - | - |
| ProjectSettingLabel | A label for displaying the value of a project setting. Base class for the other labels. |
| GitDescribeLabel | A label that automatically displays the Git describe string. |
| GitHashLabel | A label that automatically displays the latest Git commit hash. |

### Settings

GGD's project settings are found under the setting path `addons/git_describe`.

| Name | Description | Default Value |
| - | - | - |
| Append Describe to Project Name | If `true`, GGD appends the describe string to your project's name on run or export. | `false` |
| Describe Setting Path | Path of the setting that GGD sets to the describe string on run or export. | `"application/config/git_describe"` |
| Command Options<sup>[1]</sup> | Options that GGD passes to the describe command. See the [Git docs](https://git-scm.com/docs/git-describe) for available options. | `"--always --tags"` |
| User Extensions Dir<sup>[1]</sup> | Directory that GGD searches for user-made [extensions](#extensions) to load on startup. Allows presence of unrelated files. | `""` |

[1]: Advanced setting; only shown when the "Advanced Settings" option is enabled.

### Extensions

Extensions add new features for GGD to use when you run or export your project. GGD uses extensions internally, which are a helpful reference when making your own.

To create and enable an extension:

1. Create a script that extends `GitDescribeExtension`.
2. Override `_init` with any setup your extension needs.
3. Override `_set_describe` to make changes with the describe string.
4. Override `_erase_describe` to undo the changes made by `_set_describe`.
5. Set the "User Extensions Dir" project setting to the directory that contains your extension.
6. Reload the project.

## Contributing

Contributions are welcome. Please try to follow these guidelines:

- [GDScript style guide](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_styleguide.html)
- [Git style guide](https://github.com/agis/git-style-guide)
