extends EditorExportPlugin

var set_describe_callable: Callable
var erase_describe_callable: Callable


func _get_name() -> String:
	return "godot_git_describe_exporter"


func _export_begin(
		_features: PackedStringArray,
		_is_debug: bool,
		_path: String,
		_flags: int
) -> void:
	set_describe_callable.call()


func _export_end() -> void:
	erase_describe_callable.call()
