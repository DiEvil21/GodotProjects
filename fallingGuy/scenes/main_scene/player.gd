extends KinematicBody

const MAX_SPEED = 10

var vel = Vector3()
var fix =  []
var speed = []

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			fix = [event.position.x , event.position.y]
		else:
			fix = []
			speed = []
	elif event is InputEventScreenDrag:
		speed = [fix[0] - event.position.x, fix[1] - event.position.y]

func _physics_process(delta):
	var dir = Vector3()
	if speed:
		dir.x = -speed[0]
		dir.z = -speed[1]
	vel.x = dir.x
	vel.z = dir.z
	vel = move_and_slide(vel * delta * 10)
