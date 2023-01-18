extends StaticBody


# Declare member variables here. Examples:
# var a = 2

export(Array, PackedScene) var scenes

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var lol =  randi()%16
	
	
	
	var road1 = scenes[lol].instance()
	road1.set_translation(Vector3(0,0,0))
	add_child(road1)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
