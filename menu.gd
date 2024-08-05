extends Control


func _ready():
	if Save.first_load == true:
		Save.dload()
		Save.first_load = false
	#print(Save.data["clicks"])

func _on_start_pressed():
	get_tree().change_scene_to_file("res://main.tscn")


func _on_close_pressed():
	get_tree().quit()


func _on_options_pressed():
	get_tree().change_scene_to_file("res://options.tscn")
