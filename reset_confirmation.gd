extends Control

var data_default = {
	"clicks" = "0",
	"coins" = "0",
	"clicks_per_coin" = "10",
	"auto_clicks" = "0",
	"theme" = "neco",
	"jelly" = "false",
	"boy" = "false",
}


func _on_yes_pressed():
	Save.data = data_default
	queue_free()


func _on_no_pressed():
	queue_free()
