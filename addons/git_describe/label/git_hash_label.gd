@tool
@icon("icon.svg")
class_name GitHashLabel
extends ProjectSettingLabel


func _get_initial_setting_name() -> String:
	return "addons/git_describe/commit_hash"
