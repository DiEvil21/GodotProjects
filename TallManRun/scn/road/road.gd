extends Spatial


export(PackedScene) onready var let_scene
func _ready():
	spawnLet()



func spawnLet():
	if let_scene != null:
		randomize()
		#if randi()%3 == 1:
		var let = let_scene.instance()
		add_child(let)
