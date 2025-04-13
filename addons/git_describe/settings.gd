extends RefCounted

const DESCRIBE_SETTING = "application/config/git_describe"


static func set_describe_setting(value: Variant) -> void:
	ProjectSettings.set_setting(DESCRIBE_SETTING, value)
	ProjectSettings.save()
