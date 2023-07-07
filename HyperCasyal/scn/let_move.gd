extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.x > 1000:
		queue_free()
	position.x += 3


func _on_coin_area_area_entered(area):
	if "player" in area.name:
		$coin.queue_free()
		Global.score += 1
