extends KinematicBody


var vel  = Vector3()
var speed = 0
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	vel.x = -speed * delta
	move_and_slide(vel,Vector3.UP)
	
