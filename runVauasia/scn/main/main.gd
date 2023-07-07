extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.set_text("Score: " + String(int(Global.player_pos.z)*-1))


func _on_player_area_area_entered(area):
	print(area.name)
	if "game_over" in area.name:
		get_tree().paused = true
		$"restart_dialog".visible = true


func _on_Button_pressed():
	$"restart_dialog".visible = false
	Global.next_spawn_point = Vector3(0,0,0)
	Global.player_pos = Vector3(0,0,0)
	get_tree().paused = false
	get_tree().reload_current_scene()
