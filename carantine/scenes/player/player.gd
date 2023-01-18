extends KinematicBody2D


export (int) var speed = 400

var target = Vector2()
var velocity = Vector2()
var touchPos

var click
var mn = 0
onready var sprite = $AnimatedSprite
onready var label = get_node("/root/Control/CenterContainer/TextureRect/Label")
var sleep = false

func _ready():
	position = Global.playerPosition

func _unhandled_input(event):
	if event is InputEventScreenTouch and event.pressed == true:
		touchPos = get_canvas_transform().affine_inverse().xform(event.position)
		click = true
		
		

func _physics_process(delta):
	print(position)
	if click == true:
		click = false
		if Global.sleep == false:
			target = get_global_mouse_position()
			target = touchPos
			
	
	velocity = position.direction_to(target) * speed
	
	if position.distance_to(target) > 5:
		velocity = move_and_slide(velocity)

	if velocity.x < 0 and Global.sleep == false and Global.smoke == false:
		sprite.flip_h = true
		sprite.play('run')
	elif velocity.x > 0 and Global.sleep == false and Global.smoke == false:
		sprite.flip_h = false
		sprite.play('run')
	if position.distance_to(target) < 5 and Global.sleep == false and Global.smoke == false:
		sprite.play('stay')
	if Global.lay == true:
		sprite.play('sleep')
		target = Vector2(-2125.983,574)
		$collus.disabled = true
		
		sprite.flip_h = false
	else:
		
		$collus.disabled = false
	#--------------------smoke--------------
	if Global.smoke2 == true:
		
		sprite.flip_h = false
		target = Vector2(-435,-384)
		sprite.play('smoke')










func _on_sleep_area_entered(area):
	Global.sleep = true
	print('fdfsfsd')


func _on_sleep_area_exited(area):
	Global.sleep = false
	Global.lay = false


func _on_smoke_area_entered(area):
	Global.smoke = true
	


func _on_smoke_area_exited(area):
	Global.smoke = false





func _on_compOn_area_entered(area):
	Global.compOn = true


func _on_compOn_area_exited(area):
	Global.compOn = false


func _on_phone_area_entered(area):
	Global.phone = true


func _on_phone_area_exited(area):
	Global.phone = false


func _on_takeSig_area_entered(area):
	Global.takeSig = true


func _on_takeSig_area_exited(area):
	Global.takeSig = false
