@tool
class_name ProjectSettingLabel
extends Label
## A label for displaying the value of a project setting.

# These are kept public to preserve compatibility with 1.x releases.
const SETTING_PROPERTY = &"setting_name"
const DEFAULT_PROPERTY = &"default_value"

const _ITERATIVE_PROPERTY = &"iterative"

@export var setting_name: String = _get_initial_setting_name()
@export var default_value: String = _get_initial_default_value()

## If [code]true[/code], [member Label.text] will be set to the value of the
## project setting even if that value is empty.
@export var set_if_value_empty := false

## If [code]true[/code], the value of the project setting will be iteratively
## used as the name of the project setting to get the next value from.
## Iteration stops when the next value is empty.
@export var iterative: bool = _get_initial_is_iterative()


func _ready() -> void:
	if Engine.is_editor_hint():
		return

	var setting: String
	if iterative:
		setting = _get_setting_iterative(setting_name, default_value)

	else:
		setting = ProjectSettings.get_setting(setting_name, default_value)

	if setting.is_empty() and not set_if_value_empty:
		return

	text = setting


func _property_can_revert(property: StringName) -> bool:
	return property in [SETTING_PROPERTY, DEFAULT_PROPERTY, _ITERATIVE_PROPERTY]


func _property_get_revert(property: StringName) -> Variant:
	match property:
		SETTING_PROPERTY:
			return _get_initial_setting_name()

		DEFAULT_PROPERTY:
			return _get_initial_default_value()

		_ITERATIVE_PROPERTY:
			return _get_initial_is_iterative()

	return null


func _get_setting_iterative(setting: String, default: Variant = null) -> String:
	var value: String = ProjectSettings.get_setting(setting, default)
	var next_value: String = ProjectSettings.get_setting(value, "")
	while not next_value.is_empty():
		value = next_value
		next_value = ProjectSettings.get_setting(next_value, "")

	return value


func _get_initial_setting_name() -> String:
	return ""


func _get_initial_default_value() -> String:
	return ""


func _get_initial_is_iterative() -> bool:
	return true
