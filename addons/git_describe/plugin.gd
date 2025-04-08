@tool
extends EditorPlugin

const Debugger = preload("debugger.gd")
const Exporter = preload("exporter.gd")
const Utilities = preload("utilities.gd")

var debugger := Debugger.new()
var exporter := Exporter.new()


func _enter_tree() -> void:
	add_debugger_plugin(debugger)
	add_export_plugin(exporter)
	Utilities.push_status()


func _build() -> bool:
	Utilities.update_version_setting()
	return true


func _disable_plugin() -> void:
	remove_debugger_plugin(debugger)
	remove_export_plugin(exporter)
	Utilities.erase_version_setting()


func _exit_tree() -> void:
	_disable_plugin()
