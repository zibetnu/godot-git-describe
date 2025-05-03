<h1 align="center">Godot Git Describe</h1>
<p align="center">
  <img src="./git_describe_demo/icon.svg", width=30%>
</p>

<p align="center">
  <a href="https://godotengine.org/download/" target="_blank">
    <img alt="Godot v4.1+" src="https://img.shields.io/badge/Godot_v4.1+-478cbf?logo=godotengine&logoColor=ffffff&style=for-the-badge" />
  </a>
  <a href="LICENSE">
    <img alt="License" src="https://img.shields.io/github/license/zibetnu/godot-git-describe?style=for-the-badge&color=8eef97">
  </a>
  <a href="https://github.com/zibetnu/godot-git-describe/releases">
    <img alt="Latest Release" src="https://img.shields.io/github/v/release/zibetnu/godot-git-describe?include_prereleases&style=for-the-badge&color=ef476f">
  </a>
</p>

<p align="center">
  <img alt="Linux" src="https://img.shields.io/badge/Linux-fcc624?style=flat-square&logo=linux&logoColor=333333">
  <img alt="Steam Linux Runtime" src="https://img.shields.io/badge/Steam_Linux_Runtime-000000?style=flat-square&logo=steam">
  <img alt="Windows" src="https://img.shields.io/badge/Windows-007acf?style=flat-square">
</p>

Do you use [tags](https://git-scm.com/book/en/v2/Git-Basics-Tagging) to label your project's releases? Do you want to display those labels in your project without manually setting a separate value?

You've come to the right place.

## Features

- Adds your Git repository's [description](https://git-scm.com/docs/git-describe) to your project when you run or export it.
- Avoids cluttering diffs by reversing changes when you stop your project or an export is finished.
- Batteries included: comes with nodes and settings that cover common use cases.

## Installation

See the Godot documentation for installing plugins:

https://docs.godotengine.org/en/stable/tutorials/plugins/editor/installing_plugins.html

> [!NOTE]
> This plugin uses Godot 4.4's UID system. Godot 4.3 and earlier will adjust the UIDs after printing a warning on the first run.

## Usage

1. Label a release using a [tag](https://git-scm.com/book/en/v2/Git-Basics-Tagging)
2. Add a GitDescribeLabel to a scene or adjust project settings as desired
3. Run or export the project

> [!TIP]
> For best results, do not commit automatic changes to version control.

### Settings

GGD's project settings are found under the setting path `addons/git_describe`.

| Name | Description | Default Value |
| - | - | - |
| Append Describe to Project Name | If `true`, GGD appends the describe string to your project's name on run or export. | `false` |
| Describe Setting Path | Path of the setting that GGD sets to the describe string on run or export. | `"application/config/git_describe"` |
| Command Options<sup>[1]</sup> | Options that GGD passes to the describe command. See the [Git docs](https://git-scm.com/docs/git-describe) for available options. | `"--always"` |
| User Extensions Dir<sup>[1]</sup> | Directory that GGD searches for user-made [extensions](#extensions) to load on startup. Allows presence of unrelated files. | `""` |

[1]: Advanced setting; only shown when the "Advanced Settings" option is enabled.

### Extensions

Extensions add new features for GGD to use when you run or export your project. GGD uses extensions internally, which are a helpful reference when making your own.

To create and enable an extension:

1. Create a script that extends `GitDescribeExtension`
2. Override `_init` with any setup your extension needs
3. Override `_set_describe` to make changes with the describe string
4. Override `_erase_describe` to undo the changes made by `_set_describe`
5. Set the "User Extensions Dir" project setting to the directory that contains your extension
6. Reload the project
