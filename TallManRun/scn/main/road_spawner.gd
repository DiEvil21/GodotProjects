extends Spatial


export(PackedScene) onready var road_scene
export(PackedScene) onready var finish_scene
const ROAD_COL = 7

func _ready():
	for i in ROAD_COL:
		spawnRoad()
	spawnFinish()



func spawnRoad():
	if road_scene != null:
		print("spawnRoad")
		var road1 = road_scene.instance()
		road1.set_translation(Global.next_spawn_point)
		add_child(road1)
		Global.next_spawn_point = road1.get_node("end").get_global_translation()

func spawnFinish():
	if finish_scene != null:
		var finish = finish_scene.instance()
		finish.set_translation(Global.next_spawn_point)
		add_child(finish)
