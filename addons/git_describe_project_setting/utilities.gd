@tool
extends RefCounted

const DEFAULT_GIT_DESCRIBE = ""
const CONFIG_PATH = "res://addons/git_describe_project_setting/platforms.cfg"
const REPOSITORY_PATH = "res://"
const SETTING_PATH = "application/config/version"

static var config: ConfigFile:
	get = get_config


static func get_config() -> ConfigFile:
	if config == null:
		config = ConfigFile.new()
		config.load(CONFIG_PATH)

	return config


static func get_git_describe() -> String:
	if not is_git_repository_found():
		return DEFAULT_GIT_DESCRIBE

	if not is_git_found():
		return DEFAULT_GIT_DESCRIBE

	var git_describe: String = platform_execute("git describe")
	if git_describe.is_empty():
		return DEFAULT_GIT_DESCRIBE

	return git_describe.strip_edges()


static func get_platform_name() -> String:
	if is_in_steam_runtime():
		return "Steam Linux Runtime"

	return OS.get_name()


static func is_git_found() -> bool:
	if not is_platform_configured():
		return false

	var command: String = " ".join(
			[config.get_value(get_platform_name(), "which"), "git"]
	)
	return not platform_execute(command).is_empty()


static func is_git_repository_found() -> bool:
	return DirAccess.dir_exists_absolute(REPOSITORY_PATH.path_join(".git"))


# https://gitlab.steamos.cloud/steamrt/steam-runtime-tools/-/blob/main/docs/slr-for-game-developers.md#detecting-the-container-environment
static func is_in_steam_runtime() -> bool:
	if OS.get_name() != "Linux":
		return false

	const CAT_COMMAND = "cat"
	var output: Array[String] = []
	OS.execute(CAT_COMMAND, ["/etc/os-release"], output)
	if "steamrt" in output[0]:
		return true

	OS.execute(CAT_COMMAND, ["/run/host/container-manager"], output)
	if "pressure-vessel" in output[1]:
		return true

	return false


static func is_platform_configured() -> bool:
	return OS.get_name() in config.get_sections()


static func platform_execute(command: String) -> String:
	var platform_name: String = get_platform_name()
	var path: String = config.get_value(platform_name, "path")

	var arguments: Array[String] = []
	arguments.assign(config.get_value(platform_name, "arguments") as Array)
	arguments.append(command)

	var output: Array[String] = []
	OS.execute(path, arguments, output, true)
	return output[0]


static func print_errors() -> void:
	var globalize_path: Callable = ProjectSettings.globalize_path
	if not is_platform_configured():
		printerr(
				"%s configuration not found in %s." % [
					get_platform_name(),
					globalize_path.call(CONFIG_PATH)
				]
		)

	if not is_git_repository_found():
		const TEMPLATE = "Git repository not found in %s."
		printerr(TEMPLATE % globalize_path.call(REPOSITORY_PATH))

	if not is_git_found():
		printerr("Git not found.")


static func update_version_setting() -> void:
	ProjectSettings.set_setting(SETTING_PATH, get_git_describe())
	ProjectSettings.save()


static func erase_version_setting() -> void:
	ProjectSettings.set_setting(SETTING_PATH, null)
	ProjectSettings.save()
