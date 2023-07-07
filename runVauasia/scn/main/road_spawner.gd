extends Spatial

export(PackedScene) onready var road_scene
const ROAD_COL = 5

func _ready():
	for i in ROAD_COL:
		spawnRoad()



func spawnRoad():
	if road_scene != null:
		print("spawnRoad")
		var road1 = road_scene.instance()
		road1.set_translation(Global.next_spawn_point)
		add_child(road1)
		Global.next_spawn_point = road1.get_node("end").get_global_translation()


func _on_player_area_area_entered(area):
	if "road" in area.name:
		spawnRoad()
		area.get_parent().queue_free()
