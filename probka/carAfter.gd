extends KinematicBody
var vel = Vector3()
var speed =0
var but =0
var flag = 1
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if translation.x <38 and but==0:
		speed -= 30
	elif but==0:
		speed = 0
	
	
	
	vel.x = -speed * delta
	lerp(vel.x,0,0.05)
	move_and_slide(vel,Vector3.UP)
	lerp(vel.x,0,0.05)
