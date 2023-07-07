extends Spatial


export(PackedScene) onready var let_scene
var array = [-2.8,0,2.8]
const LET_COL = 20
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in LET_COL:
		spawnLet()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func spawnLet():
	if let_scene != null:
		var let = let_scene.instance()
		randomize()
		var rand_value = array[randi() % array.size()]
		let.set_translation(Vector3(rand_value,0.174,Global.player_pos.z + randi()%50-100))
		print(let.translation)
		add_child(let)


func _on_player_area_area_entered(area):
	if "let" in area.name:
		spawnLet()
		area.get_parent().queue_free()
