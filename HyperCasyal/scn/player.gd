extends KinematicBody2D


const ROT_NUM = 3
var rot_right = true

func _physics_process(delta):
	if rot_right:
		rotation_degrees += ROT_NUM
	else:
		rotation_degrees -= ROT_NUM

func _unhandled_input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			rot_right = !rot_right


func _on_player_area_area_entered(area):
	if "let" in area.name:
		queue_free()
