extends Control

const Utilities = preload(
		"res://addons/git_describe_project_setting/utilities.gd"
)

@onready var git_describe: Label = %GitDescribe
@onready var platform_configured: CheckBox = %PlatformConfigured
@onready var repository_found: CheckBox = %RepositoryFound
@onready var git_found: CheckBox = %GitFound
@onready var tag_found: CheckBox = %TagFound


func _ready() -> void:
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
	var is_tag_found: bool = Utilities.is_tag_found()
	set_pressed_colorful(
			tag_found,
			is_tag_found
	)
	if is_tag_found:
		git_describe.text = ProjectSettings.get_setting(
				"application/config/version"
		)


func set_pressed_colorful(button: Button, value: bool) -> void:
	button.set_pressed(value)
	button.modulate = Color.LIGHT_GREEN if value else Color.LIGHT_CORAL
