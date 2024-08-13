extends Node

signal theme_changed()
@export var current_theme : GameTheme

func set_theme(theme):
	if theme != current_theme:
		current_theme = theme
		theme_changed.emit()

