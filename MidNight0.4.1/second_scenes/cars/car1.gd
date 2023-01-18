extends KinematicBody


const MAXVIEW = 80
var roadSpeed = 0
var rng = RandomNumberGenerator.new()
var vel = Vector3()
var touch 
var projectResolutionx = 1280


var speed = 30 + rng.randi_range(5,10)
func _ready():
	GlobalInfo.score = -5
	projectResolutionx = get_viewport().size.x


func _physics_process(delta):
	print(GlobalInfo.score)
	if speed < 50:
		speed+=10*delta
	if Input.is_action_pressed("ui_right"):
		if speed > 10:
			if touch > projectResolutionx/3 and touch < (projectResolutionx/3) * 2:
				speed -= 50*delta
				
		else:
			speed ==11
	
	print('car = ',speed)
	rng.randomize()
	vel.z = -speed + rng.randi_range(5,10)
	var collision = move_and_collide(vel * delta)
	
	
	
	
	
	
	if collision:
		vel = vel.bounce(collision.normal)
		if collision.collider.has_method("hit"):
			collision.collider.hit()
			pass

	#move_and_slide(vel, Vector3.UP)
	#vel.z = lerp(vel.x,0,0.2)
	if get_translation().z < 0:
		GlobalInfo.score +=1
		set_translation(Vector3((randomForCar()+0.561)*randomOfOne(-1,0),0,MAXVIEW - rng.randi_range(-2,2)*10))
		
	#debug-------------------------------
	#print('car position ',get_translation().x)



func randomOfOne(a,b):
	a  = rng.randi_range(a,b)
	if a > -1:
		a = a + 1
	return a
	
func randomForCar():
	var c = rng.randi_range(1,2)
	if c > 1:
		c= c+2
	return c
	
func _input(event):
	if not event is InputEventScreenTouch:
		return
	print(event.get_position())
	if event.pressed:
		Input.action_press("ui_right")
	else:
		Input.action_release("ui_right")
	touch = event.get_position().x
