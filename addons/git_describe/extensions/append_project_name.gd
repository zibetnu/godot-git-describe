extends GitDescribeExtension

const APPEND_SETTING = "append_describe_to_project_name"
const PROJECT_NAME_SETTING = "application/config/name"

var cached_project_name: String
var nothing_to_undo: bool


func _init() -> void:
	PluginSettings.init_setting(APPEND_SETTING, false)


func _set_describe(describe: String) -> void:
	if not PluginSettings.get_setting(APPEND_SETTING, false):
		return

	nothing_to_undo = describe.is_empty()
	if describe.is_empty():
		return

	cached_project_name = ProjectSettings.get_setting(PROJECT_NAME_SETTING)
	ProjectSettings.set_setting(
			PROJECT_NAME_SETTING,
			" ".join([cached_project_name, describe])
	)


func _erase_describe() -> void:
	if not PluginSettings.get_setting(APPEND_SETTING, false):
		return

	if cached_project_name.is_empty():
		return

	if nothing_to_undo:
		return

	ProjectSettings.set_setting(PROJECT_NAME_SETTING, cached_project_name)
	cached_project_name = ""
	nothing_to_undo = true
