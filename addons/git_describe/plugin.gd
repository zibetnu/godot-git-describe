@tool
extends EditorPlugin

const Debugger = preload("debugger.gd")
const Exporter = preload("exporter.gd")
const Settings = preload("settings.gd")
const Utilities = preload("utilities.gd")

var debugger := Debugger.new()
var exporter := Exporter.new()


func _enter_tree() -> void:
	debugger.erase_describe_callable = _erase_describe
	exporter.erase_describe_callable = _erase_describe
	exporter.set_describe_callable = _set_describe

	add_debugger_plugin(debugger)
	add_export_plugin(exporter)
	Settings.init_settings()
	Utilities.push_status()


func _build() -> bool:
	_set_describe()
	return true


func _disable_plugin() -> void:
	remove_debugger_plugin(debugger)
	remove_export_plugin(exporter)
	_erase_describe()


func _exit_tree() -> void:
	_disable_plugin()


func _set_describe() -> void:
	var describe: String = Utilities.get_git_describe(
			Settings.get_command_options()
	)
	Settings.set_describe_setting(describe)
	Settings.append_project_name(describe, true)


func _erase_describe() -> void:
	Settings.set_describe_setting(null)
	Settings.append_project_name(Settings.cached_describe, false)
