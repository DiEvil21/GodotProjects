extends KinematicBody


var vel = Vector3()
var speed =0
var but =0
var flag = 1
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if translation.x >24 and flag and but:
		vel.x = -speed * delta
	elif translation.x >25:
		vel.x = 0
		flag = 1
	if translation.x <23:
		vel.x = speed * delta
		flag = 0
	
	move_and_slide(vel,Vector3.UP)
	print("fdfdfdddfdfd " , speed)
	
func get_transx():
	if translation.x >24:
		return 1
	else:
		return 0
