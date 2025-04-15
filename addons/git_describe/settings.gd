extends RefCounted

const BASE = "addons/git_describe"
const SETTING_PATH_SETTING = BASE + "/describe_setting_path"
const DEFAULT_SETTING_PATH = "application/config/git_describe"


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


static func set_describe_setting(value: Variant) -> void:
	var describe_setting: String = ProjectSettings.get_setting(
			SETTING_PATH_SETTING,
			DEFAULT_SETTING_PATH
	)
	ProjectSettings.set_setting(describe_setting, value)
	ProjectSettings.save()
