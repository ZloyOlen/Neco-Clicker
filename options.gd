extends Control

@onready var confirmation = load("res://reset_confirmation.tscn")


	

func _on_back_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")


func _on_reset_pressed():
	var confirm = confirmation.instantiate()
	add_child(confirm)
