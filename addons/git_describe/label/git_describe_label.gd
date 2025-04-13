@icon("icon.svg")
class_name GitDescribeLabel
extends Label
## A label for displaying Git describe text.


func _ready() -> void:
	set_text_to_describe()


## Sets [member Label.text] to the describe string unless the string is empty.
func set_text_to_describe() -> void:
	var describe_setting: String = ProjectSettings.get_setting(
			"addons/git_describe/describe_setting_path",
			"application/config/git_describe"
	)
	var describe: String = ProjectSettings.get_setting(describe_setting, "")
	if describe.is_empty():
		return

	text = describe
