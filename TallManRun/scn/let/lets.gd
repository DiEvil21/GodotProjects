extends Spatial


export(Array, PackedScene) var lets
func _ready():
	randomize()
	randi() % lets.size()
	var let = lets[randi() % lets.size()].instance()
	let.set_translation(Vector3(0,0,0))
	add_child(let)
