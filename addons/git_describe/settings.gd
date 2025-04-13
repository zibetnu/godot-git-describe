extends RefCounted

const BASE = "addons/git_describe"
const DESCRIBE_SETTING_NAME = BASE + "/describe_setting_path"
const DEFAULT_DESCRIBE_SETTING_VALUE = "application/config/git_describe"


static func init_settings() -> void:
	if not ProjectSettings.has_setting(DESCRIBE_SETTING_NAME):
		ProjectSettings.set_setting(
				DESCRIBE_SETTING_NAME,
				DEFAULT_DESCRIBE_SETTING_VALUE
		)

	ProjectSettings.set_as_basic(DESCRIBE_SETTING_NAME, true)
	ProjectSettings.set_initial_value(
			DESCRIBE_SETTING_NAME,
			DEFAULT_DESCRIBE_SETTING_VALUE
	)


static func set_describe_setting(value: Variant) -> void:
	var describe_setting: String = ProjectSettings.get_setting(
			DESCRIBE_SETTING_NAME,
			DEFAULT_DESCRIBE_SETTING_VALUE
	)
	ProjectSettings.set_setting(describe_setting, value)
	ProjectSettings.save()
