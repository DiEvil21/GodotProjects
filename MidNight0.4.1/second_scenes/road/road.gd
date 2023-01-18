extends KinematicBody

const MAXROADSPEED = 20
var touch 
const MAXVIEW = 66
var vel = Vector3()
var speed = MAXROADSPEED
var projectResolutionx = 1280
func _ready():
	
	projectResolutionx = get_viewport().size.x
	#$AnimationPlayer.play("lightblick")
	pass

func _physics_process(delta):
	print(speed)
	if speed < MAXROADSPEED:
		speed+=10*delta
	if Input.is_action_pressed("ui_right"):
		if speed > 10:
			if touch > projectResolutionx/3 and touch < (projectResolutionx/3) * 2:
				speed -= 50*delta
			
		else:
			speed = 11
	vel.z = -speed
	move_and_slide(vel, Vector3.UP)
	#respawn road
	if .get_translation().z < -33:
		set_translation(Vector3(0,0,MAXVIEW+MAXVIEW/2))
	
	
func _input(event):
	if not event is InputEventScreenTouch:
		return
	print(event.get_position())
	if event.pressed:
		Input.action_press("ui_right")
	else:
		Input.action_release("ui_right")
	touch = event.get_position().x
