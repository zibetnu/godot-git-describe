@tool
@icon("icon.svg")
class_name GitDescribeLabel
extends ProjectSettingLabel
## A label for automatically displaying Git describe strings.


func _get_initial_setting_name() -> String:
	return "addons/git_describe/describe_setting_path"


func _get_initial_default_value() -> String:
	return "application/config/git_describe"
