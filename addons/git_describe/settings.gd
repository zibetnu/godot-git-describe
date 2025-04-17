@tool
extends RefCounted

const BASE = "addons/git_describe/"

const SETTING_PATH_SETTING = BASE + "describe_setting_path"
const DEFAULT_SETTING_PATH = "application/config/git_describe"

const APPEND_PROJECT_NAME_SETTING = BASE + "append_describe_to_project_name"
const DEFAULT_APPEND_PROJECT_NAME = false
const PROJECT_NAME_SETTING = "application/config/name"

const COMMAND_OPTIONS_SETTING = BASE + "command_options"
const DEFAULT_COMMAND_OPTIONS = "--always"

static var cached_describe: String


static func init_setting(
		setting_name: String,
		initial_value: Variant,
		basic := true
) -> void:
	if not ProjectSettings.has_setting(setting_name):
		ProjectSettings.set_setting(setting_name, initial_value)

	ProjectSettings.set_as_basic(setting_name, basic)
	ProjectSettings.set_initial_value(setting_name, initial_value)


static func init_settings() -> void:
	init_setting(SETTING_PATH_SETTING, DEFAULT_SETTING_PATH)
	init_setting(APPEND_PROJECT_NAME_SETTING, DEFAULT_APPEND_PROJECT_NAME)
	init_setting(COMMAND_OPTIONS_SETTING, DEFAULT_COMMAND_OPTIONS, false)


static func append_project_name(describe: String, append: bool) -> void:
	if not ProjectSettings.get_setting(APPEND_PROJECT_NAME_SETTING, false):
		return

	var project_name: String = ProjectSettings.get_setting(
			PROJECT_NAME_SETTING
	)
	var separated_describe: String = " " + describe
	match [append, project_name.ends_with(separated_describe)]:
		[false, true]:
			cached_describe = ""
			project_name = project_name.replace(separated_describe, "")

		[true, false]:
			cached_describe = describe
			project_name += separated_describe

	ProjectSettings.set_setting(PROJECT_NAME_SETTING, project_name)
	ProjectSettings.save()


static func get_command_options() -> String:
	return ProjectSettings.get_setting(
			COMMAND_OPTIONS_SETTING,
			DEFAULT_COMMAND_OPTIONS
	)


static func set_describe_setting(value: Variant) -> void:
	var describe_setting: String = ProjectSettings.get_setting(
			SETTING_PATH_SETTING,
			DEFAULT_SETTING_PATH
	)
	ProjectSettings.set_setting(describe_setting, value)
	ProjectSettings.save()
