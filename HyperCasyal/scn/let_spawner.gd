extends Node2D


export(Array, PackedScene) var lets
func _ready():
	pass # Replace with function body.


	
	
func spawnLet():
	randomize()
	var let = lets[randi()%lets.size()].instance()
	randomize()
	
	let.set_position(Vector2(-300,randi()%300 - 150))
	add_child(let)

func _on_Timer_timeout():
	spawnLet()
