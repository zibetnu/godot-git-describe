@icon("icon.svg")
class_name GitDescribeLabel
extends Label
## A label for displaying Git describe text.

## The setting from which the GitDescribeLabel will get the describe string.
const DESCRIBE_SETTING = "application/config/git_describe"

## If [code]true[/code], [method set_text_to_describe] does not set
## [member Label.text] when the describe string is empty.
@export var ignore_empty := true


func _ready() -> void:
	set_text_to_describe()


## Sets [member Label.text] to the describe string, unless the string is empty and
## [member ignore_empty] is [code]true[/code].
func set_text_to_describe() -> void:
	var describe: String = ProjectSettings.get_setting(DESCRIBE_SETTING, "")
	if describe.is_empty() and ignore_empty:
		return

	text = describe
