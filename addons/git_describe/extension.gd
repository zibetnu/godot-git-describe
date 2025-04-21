class_name GitDescribeExtension
extends RefCounted

const SETTINGS_BASE_PATH = "addons/git_describe"


func init_setting(
		partial_name: String,
		initial_value: Variant,
		basic := true
) -> void:
	var setting_name: String = SETTINGS_BASE_PATH.path_join(partial_name)
	if not ProjectSettings.has_setting(setting_name):
		ProjectSettings.set_setting(setting_name, initial_value)

	ProjectSettings.set_as_basic(setting_name, basic)
	ProjectSettings.set_initial_value(setting_name, initial_value)


func get_setting(
		partial_name: String,
		default_value: Variant
) -> Variant:
	return ProjectSettings.get_setting(
			SETTINGS_BASE_PATH.path_join(partial_name),
			default_value
	)


func set_setting(partial_name: String, value: Variant) -> void:
	ProjectSettings.set_setting(
			SETTINGS_BASE_PATH.path_join(partial_name),
			value
	)
	ProjectSettings.save()


func set_describe(describe: String) -> void:
	_set_describe(describe)


func erase_describe() -> void:
	_erase_describe()


func _set_describe(_describe: String) -> void:
	pass


func _erase_describe() -> void:
	pass
