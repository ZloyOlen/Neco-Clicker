extends Node

var FILE_NAME = "user://save.json"


var data = {
	"clicks" = "0",
	"coins" = "0",
	"clicks_per_coin" = "10",
	"auto_clicks" = "0",
	"theme" = "res://themes/neco/necoarc.tres",
	"jelly" = "false",
}

#var music = themes.current_theme.music

var first_load = true

func _ready():
	themes.theme_changed.connect(_on_theme_changed)
	themes.set_theme(load(data["theme"]))


func dsave():
	var file = FileAccess.open("user://save.save", FileAccess.WRITE)
	var json_string = JSON.stringify(data)
	file.store_line(json_string)
	file.close()

func dload():
	if not FileAccess.file_exists("user://save.save"):
		return
	var file = FileAccess.open("user://save.save", FileAccess.READ)
	while file.get_position() < file.get_length():
		var json_string = file.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		#print(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue
			
		var node_data = json.get_data()
		#print(node_data)
		for key in node_data.keys():
			#print(data[key])
			#print(node_data[key])
			data[key] = node_data[key] 
			
			
	#print(data["clicks"])
	file.close()

func _on_theme_changed():
	$bgm.stream = themes.current_theme.music
	$bgm.play()
