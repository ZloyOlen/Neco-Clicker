extends Control


func _ready():
	if Save.first_load == true:
		Save.dload()
		Save.first_load = false
	apply_theme()
	
	themes.theme_changed.connect(_on_theme_changed)
	#print(Save.data["clicks"])

func _on_start_pressed():
	get_tree().change_scene_to_file("res://main.tscn")


func _on_close_pressed():
	get_tree().quit()


func _on_options_pressed():
	get_tree().change_scene_to_file("res://options.tscn")

func apply_theme():
	$Title.texture = themes.current_theme.title
	$"Neco Santa".texture = themes.current_theme.sprite1
	$"Ceiling Neco".texture = themes.current_theme.sprite2
	$"Sexy Neco".texture = themes.current_theme.sprite3
	$"Running Neco".sprite_frames = themes.current_theme.gif
	$"Running Neco".play("gif")
	

func _on_theme_changed():
	apply_theme()
