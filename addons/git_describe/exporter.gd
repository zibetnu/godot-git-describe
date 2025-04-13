extends EditorExportPlugin

const Utilities = preload("utilities.gd")


func _get_name() -> String:
	return "godot_git_describe_exporter"


func _export_begin(
		_features: PackedStringArray,
		_is_debug: bool,
		_path: String,
		_flags: int
) -> void:
	Utilities.update_version_setting()


func _export_end() -> void:
	Utilities.erase_version_setting()
