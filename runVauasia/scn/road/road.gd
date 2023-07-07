extends Spatial



var roads = [preload("res://scn/road/Forest1.tscn"), preload("res://scn/road/River.tscn")]
func _ready():
	if roads != null:
		randomize()
		var road1 = roads[randi() % roads.size()].instance()
		road1.set_translation(Vector3(0,0,0))
		add_child(road1)
		
	pass
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
