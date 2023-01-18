extends Spatial


export(PackedScene) onready var road_scene
const ROADLENGHT = 47.96
var pos = 1
const ROAD_COL = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in ROAD_COL:
		spawnRoad()
	

func spawnRoad():
	pos+=1
	if pos > ROAD_COL:
		pos = 1
	if road_scene != null:
		var road1 = road_scene.instance()
		print(-pos* ROADLENGHT)
		road1.set_translation(Vector3(0,-pos  * ROADLENGHT,0))
		add_child(road1)

func spawnRoad2():
	pos =  ROAD_COL
	if road_scene != null:
		var road1 = road_scene.instance()
		print(-pos* ROADLENGHT)
		road1.set_translation(Vector3(0,-pos  * ROADLENGHT,0))
		add_child(road1)
		
func _on_despawn_area_area_entered(area):
	if "despawn_road" in area.name:
		spawnRoad2()
