extends Spatial

onready var camera = $target_cam
onready var player = $player
func _ready():
	Global.next_spawn_point = Vector3(0,0,0)


func _physics_process(delta):
	camera.translation.z = player.translation.z + 2


func _on_player_area_area_entered(area):
	if "let" in area.name:
		var arr = area.name.split("_")
		print(int(arr[arr.size()-1]))
		var num = $player.scale.y + int(arr[arr.size()-1])*0.01
		var num2 = $player.scale.x + int(arr[arr.size()-1])*0.01*0.5
		print(num)
		if num > 0:
			$player.scale.y = num
			$player.scale.x = num2
	elif "finish" in area.name:
		$Control/MarginContainer/CenterContainer/VBoxContainer/Label.text = "Your size:" + String(player.scale.y* 100)
		$Control.visible = true


func _on_restart_button_pressed():
	
	$Control.visible = false
	get_tree().reload_current_scene()


func _on_Button_pressed():
	get_tree().reload_current_scene()
