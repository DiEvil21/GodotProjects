extends KinematicBody


var zSpeed = 0
var xSpeed = 1
var grav = 1
var screen_touch = false
var vel = Vector3()
var vel2 = Vector3()
var rel = 0


func _physics_process(delta):
	if screen_touch:
		zSpeed = 20
	else:
		zSpeed = lerp(20,0,0.7)
		var start_velx = vel.x
		vel.x = 0
	vel.x = rel * delta * 10
	vel.z = -zSpeed *delta * 10
	move_and_slide(vel)
	#add_force(vel,Vector3(0,1,0))
func _input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			screen_touch = true
		elif not event.is_pressed():
			screen_touch = false
	if event is InputEventScreenDrag:
		#print(event.relative.x)
		rel = event.relative.x
