extends Spatial


var array = [-2.8,0,2.8]


func _ready():
	randomize()
	var rand_value = array[randi() % array.size()]
	$RootNode/Log.set_translation(Vector3(rand_value,0.439,0))


