@icon("icon.svg")
class_name GitDescribeLabel
extends Label
## A label for displaying Git describe text.

## The setting from which the GitDescribeLabel will get the describe string.
const DESCRIBE_SETTING = "application/config/git_describe"


func _ready() -> void:
	set_text_to_describe()


## Sets [member Label.text] to the describe string unless the string is empty.
func set_text_to_describe() -> void:
	var describe: String = ProjectSettings.get_setting(DESCRIBE_SETTING, "")
	if describe.is_empty():
		return

	text = describe
