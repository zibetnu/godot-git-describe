extends EditorDebuggerPlugin

const Utilities = preload("utilities.gd")


func _setup_session(session_id: int) -> void:
	get_session(session_id).stopped.connect(Utilities.erase_version_setting)
