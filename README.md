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

Do you use [tags](https://git-scm.com/book/en/v2/Git-Basics-Tagging) to label your project's releases? Do you want to display those labels in your project without manually setting a separate value?

You've come to the right place.

## Features

- Adds your Git repository's [description](https://git-scm.com/docs/git-describe) to a project setting when you run or export your project.
- Avoids cluttering diffs by clearing the setting when you stop your project or an export is finished.
- Includes a pre-configured label so you can use this plugin without writing any new code.

## Installation

See the Godot documentation for installing plugins:

https://docs.godotengine.org/en/stable/tutorials/plugins/editor/installing_plugins.html

> [!NOTE]
> This plugin uses Godot 4.4's UID system. Godot 4.3 and earlier will adjust the UIDs after printing a warning on the first run.

## Usage

1. Label a release using a [tag](https://git-scm.com/book/en/v2/Git-Basics-Tagging).
2. Add a GitDescribeLabel to a scene that you want to display the current release.
3. Run or export the project.

### Settings

This plugin's project settings are found under the setting path `addons/git_describe`.

| Name | Description | Default Value |
| - | - | - |
| Describe Setting Path | Path of the setting to automatically change. | `"application/config/git_describe"` |

> [!TIP]
> For best results, do not commit the automatically-changed setting to version control.
