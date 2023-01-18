extends KinematicBody



var vel  = Vector3()
var speed = 1000

export(PackedScene) onready var road_scene
var pos = 0

# Load the class resource when calling load().
#var Main = load("res://scenes/main_scene/main.gd")
#onready var maincl = Main.new()



func _ready():
	pass

func _physics_process(delta):
	vel.y = speed * delta
	#print(global_transform.origin.y)
	move_and_slide(vel,Vector3.UP)

func _on_despawn_road_area_entered(area):
	if "despawn_area" in area.name:
		queue_free()
