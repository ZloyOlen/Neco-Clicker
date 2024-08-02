extends Control

#@onready var save = "res://save.gd"

func _ready():
	Save.dload()
	#print(Save.data["clicks"])

func _on_start_pressed():
	get_tree().change_scene_to_file("res://main.tscn")


func _on_close_pressed():
	get_tree().quit()


func _on_options_pressed():
	pass # Replace with function body.
