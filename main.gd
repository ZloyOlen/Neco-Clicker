extends Node2D


var coin_prog = 0

var sound = {
sound1 = load("res://themes/neco/neco-arc-sound-effect.mp3"),
sound2 = load("res://themes/neco/neco-arc-dori.mp3"),
sound3 = load("res://themes/neco/necoarc-mmmm.mp3"),
sound4 = load("res://themes/neco/necoarc-nyeh.mp3")
}

@onready var a = $neco/arc
@onready var players = [a]

@onready var menu : PackedScene = preload("res://menu.tscn")

func _ready():
	$ClickCounter.text = "Times clicked on Neco: " + str(Save.data["clicks"])
	$CoinCounter.text = "Coins: " + str(Save.data["coins"])
	#print(Save.data["clicks"])

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
					arc.bus = "SFX"
					$neco.add_child(arc)
					players.append(arc)
					arc.play()
		Save.data["clicks"] = int(Save.data["clicks"]) + 1
		coin_prog += 1
		if int(Save.data["clicks"]) == 444 or int(Save.data["clicks"]) == 4444:
			$neco/jhin.play()
		if coin_prog == int(Save.data["clicks_per_coin"]):
			coin_prog = 0
			Save.data["coins"] = int(Save.data["coins"]) + 1
			$CoinCounter.text = "Coins: " + str(Save.data["coins"])
		$ClickCounter.text = "Times clicked on Neco: " + str(Save.data["clicks"])
		Save.dsave()


func _process(_delta):
	if Input.is_action_just_pressed("exit"):
		Save.dsave()
		themes.set_theme(load("res://themes/jelly/jellymon.tres"))
		get_tree().change_scene_to_file("res://menu.tscn")
