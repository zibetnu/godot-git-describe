class_name GitDescribeExtension
extends RefCounted

const PluginSettings = preload("res://addons/git_describe/settings.gd")


func set_describe(describe: String) -> void:
	_set_describe(describe)


func erase_describe() -> void:
	_erase_describe()


func _set_describe(_describe: String) -> void:
	pass


func _erase_describe() -> void:
	pass
