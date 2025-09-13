@tool
extends EditorPlugin

const PluginSettings = preload("settings.gd")
const Utilities = preload("utilities.gd")

const COMMAND_OPTIONS_SETTING = "command_options"
const DEFAULT_COMMAND_OPTIONS = "--always --tags"

var debugger := Debugger.new()
var exporter := Exporter.new()
var extensions: Array[GitDescribeExtension]


func _enter_tree() -> void:
	Utilities.push_status()

	debugger.session_stopped.connect(_erase_describe)
	add_debugger_plugin(debugger)

	exporter.export_began.connect(_set_describe)
	exporter.export_ended.connect(_erase_describe)
	add_export_plugin(exporter)

	PluginSettings.init_setting(
			COMMAND_OPTIONS_SETTING,
			DEFAULT_COMMAND_OPTIONS,
			false
	)

	_init_extensions_at("res://addons/git_describe/extensions")

	const USER_DIR_SETTING = "user_extensions_dir"
	var property_info := {
		"type": TYPE_STRING,
		"hint": PROPERTY_HINT_DIR,
	}
	PluginSettings.init_setting(
			USER_DIR_SETTING, "", false, true, property_info
	)
	_init_extensions_at(
			PluginSettings.get_setting(USER_DIR_SETTING) as String
	)
	PluginSettings.sort_settings()


func _build() -> bool:
	_set_describe()
	return true


func _disable_plugin() -> void:
	remove_debugger_plugin(debugger)
	remove_export_plugin(exporter)


func _exit_tree() -> void:
	_erase_describe()


func _init_extensions_at(path: String) -> void:
	if not DirAccess.dir_exists_absolute(path):
		return

	for file in DirAccess.get_files_at(path):
		if not file.ends_with(".gd"):
			continue

		var script := load(path.path_join(file)) as GDScript
		if script == null:
			continue

		var extension := script.new() as GitDescribeExtension
		if extension == null:
			continue

		extensions.append(extension)


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


class Debugger:
	extends EditorDebuggerPlugin

	signal session_stopped

	func _setup_session(session_id: int) -> void:
		get_session(session_id).stopped.connect(
				# Wrapped in lambda function to work in Godot 4.2.
				func () -> void: session_stopped.emit()
		)


class Exporter:
	extends EditorExportPlugin

	signal export_began
	signal export_ended

	func _get_name() -> String:
		return "godot_git_describe_exporter"

	func _export_begin(
			_features: PackedStringArray,
			_is_debug: bool,
			_path: String,
			_flags: int
	) -> void:
		export_began.emit()

	func _export_end() -> void:
		export_ended.emit()
