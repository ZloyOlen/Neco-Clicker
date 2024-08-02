extends Node2D

var sound = {
sound1 = load("res://neco-arc-sound-effect.mp3"),
sound2 = load("res://neco-arc-dori.mp3"),
sound3 = load("res://necoarc-mmmm.mp3"),
sound4 = load("res://necoarc-nyeh.mp3")
}
@onready var a = $neco/arc
@onready var players = [a]
#@onready var clicks = Save.data["clicks"]

func _ready():
	$Label3.text = "Times clicked on Neco: " + str(Save.data["clicks"])
	print(Save.data["clicks"])

func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("click"):
		if players.size() > 0:
			for player in players.size():
				print(players[player])
				if !players[player].is_playing():
					players[player].stream = sound.values().pick_random()
					players[player].play()
					break
				elif player == players.size()-1:
					var arc = AudioStreamPlayer.new()
					arc.stream = sound.values().pick_random()
					$neco.add_child(arc)
					players.append(arc)
					arc.play()
		Save.data["clicks"] = int(Save.data["clicks"]) + 1
		$Label3.text = "Times clicked on Neco: " + str(Save.data["clicks"])

func _process(_delta):
	if Input.is_action_just_pressed("exit"):
		Save.dsave()
		get_tree().quit()
