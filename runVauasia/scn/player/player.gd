extends KinematicBody


#export var speed: float = 10
const SPEED = 10
const GRAV = 0.5
const TWEEN_DIST = 2.8
var vel = Vector3()
var swiped = ''
const SWIPE_SPEED = 14
const JUMP_SPEED = 10
onready var tween = $Tween
onready var shape: CapsuleShape = $CollisionShape.shape
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.player_h = shape.height
func _physics_process(delta):
	vel.y -= GRAV
	vel.z = -SPEED
	Global.player_pos = translation
	if swiped && swiped != 'swiped':
		if swiped == 'up' && is_on_floor():
			vel.y = JUMP_SPEED
		elif swiped == 'left' && translation.x >= -1:
			tween.interpolate_property(self, "translation",
				translation, translation + Vector3(-TWEEN_DIST,0,-SPEED*0.2), 0.2,
				 Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
			tween.start()
		elif swiped == 'right' && translation.x <= 1:
			tween.interpolate_property(self, "translation",
				translation, translation + Vector3(TWEEN_DIST,0,-SPEED*0.2), 0.2,
				 Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
			tween.start()
		elif swiped == 'down':
			#shape.height = shape.height/3
			$Timer.start(1)
			
		swiped = 'swiped'
	vel = move_and_slide(vel, Vector3.UP)
func _input(event):
	if event is InputEventScreenDrag:
		if !swiped:
			if event.relative.y < -SWIPE_SPEED:
				swiped = 'up'
			elif event.relative.y > SWIPE_SPEED:
				swiped = 'down'
			elif event.relative.x < - SWIPE_SPEED:
				swiped = 'left'
			elif event.relative.x > SWIPE_SPEED:
				swiped = 'right'
	elif event is InputEventScreenTouch:
		if event.is_pressed():
			swiped = ''


func _on_Timer_timeout():
	#shape.height = shape.height*3
	pass
