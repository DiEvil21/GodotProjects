extends Spatial


#const maxviewfar
const MAXVIEW = 63
var speed
#initialize road prefabs
var road_res = load('res://second_scenes/road/road.tscn')
var road = road_res.instance()
var road2 = road_res.instance()






func _ready():
	road.set_translation(Vector3(0,0,MAXVIEW/2))
	road2.set_translation(Vector3(0,0,MAXVIEW+MAXVIEW/2)) 
	add_child(road)
	
	add_child(road2)
	
	
func _physics_process(delta):
	pass
	
	
	
	#debug prints--------------------------------
	#print('road position ',road.get_translation().z)


