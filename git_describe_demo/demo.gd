extends Control

const Utilities = preload("res://addons/git_describe/utilities.gd")

@onready var skipped: Label = %Skipped
@onready var platform_configured: CheckBox = %PlatformConfigured
@onready var repository_found: CheckBox = %RepositoryFound
@onready var git_found: CheckBox = %GitFound
@onready var git_status_ok: CheckBox = %GitStatusOK


func _ready() -> void:
	if OS.has_feature("editor"):
		run_checks()

	else:
		skipped.show()


func run_checks() -> void:
	set_pressed_colorful(
			platform_configured,
			Utilities.is_platform_configured()
	)
	set_pressed_colorful(
			repository_found,
			Utilities.is_git_repository_found()
	)
	set_pressed_colorful(
			git_found,
			Utilities.is_git_found()
	)
	set_pressed_colorful(
			git_status_ok,
			Utilities.execute("git status").exit_code == 0
	)


func set_pressed_colorful(button: Button, value: bool) -> void:
	button.set_pressed(value)
	button.modulate = Color.LIGHT_GREEN if value else Color.LIGHT_CORAL
