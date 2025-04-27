@tool
extends EditorPlugin

const Debugger = preload("debugger.gd")
const Exporter = preload("exporter.gd")
const PluginSettings = preload("settings.gd")
const Utilities = preload("utilities.gd")

const COMMAND_OPTIONS_SETTING = "command_options"
const DEFAULT_COMMAND_OPTIONS = "--always"

var debugger := Debugger.new()
var exporter := Exporter.new()
var extensions: Array[GitDescribeExtension]


func _enter_tree() -> void:
	debugger.session_stopped.connect(_erase_describe)
	exporter.export_began.connect(_set_describe)
	exporter.export_ended.connect(_erase_describe)
	add_debugger_plugin(debugger)
	add_export_plugin(exporter)

	PluginSettings.init_setting(
			COMMAND_OPTIONS_SETTING,
			DEFAULT_COMMAND_OPTIONS,
			false
	)
	Utilities.push_status()
	_init_extensions()


func _build() -> bool:
	_set_describe()
	return true


func _disable_plugin() -> void:
	remove_debugger_plugin(debugger)
	remove_export_plugin(exporter)
	_erase_describe()


func _exit_tree() -> void:
	_disable_plugin()


func _init_extensions() -> void:
	const EXTENSIONS_DIR = "res://addons/git_describe/extensions"
	if not DirAccess.dir_exists_absolute(EXTENSIONS_DIR):
		return

	for file in DirAccess.get_files_at(EXTENSIONS_DIR):
		if not file.ends_with(".gd"):
			continue

		extensions.append(
				(load(EXTENSIONS_DIR.path_join(file)) as GDScript).new()
		)


func _set_describe() -> void:
	var options: String = PluginSettings.get_setting(
			COMMAND_OPTIONS_SETTING,
			DEFAULT_COMMAND_OPTIONS
	)
	var describe: String = Utilities.get_git_describe(options)
	for extension in extensions:
		extension.set_describe(describe)


func _erase_describe() -> void:
	for extension in extensions:
		extension.erase_describe()
