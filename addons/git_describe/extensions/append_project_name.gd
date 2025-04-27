extends GitDescribeExtension

const SETTING_NAME = "append_describe_to_project_name"

var cached_describe: String


func _init() -> void:
	PluginSettings.init_setting(SETTING_NAME, false)


func _set_describe(describe: String) -> void:
	append_project_name(describe, true)


func _erase_describe() -> void:
	append_project_name(cached_describe, false)


func append_project_name(describe: String, append: bool) -> void:
	if not PluginSettings.get_setting(SETTING_NAME, false):
		return

	const PROJECT_NAME_SETTING = "application/config/name"
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
