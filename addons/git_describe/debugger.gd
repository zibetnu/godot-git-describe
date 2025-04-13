extends EditorDebuggerPlugin

var erase_describe_callable: Callable


func _setup_session(session_id: int) -> void:
	get_session(session_id).stopped.connect(erase_describe_callable)
