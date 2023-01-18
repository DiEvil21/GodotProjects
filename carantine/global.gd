extends Node

var phone = false
var compOn = false
var smoke = false
var smoke2 = false
var casino = false
var sleep = false
var lay = false
var takeSig = false
var hp = 10
var happy = 20
var sig = 10
var rep = 20
var cash = 1500
var playerPosition= Vector2(-68,144)


func _process(delta):
	if hp < 1 :
		phone = false
		compOn = false
		smoke = false
		smoke2 = false
		casino = false
		sleep = false
		lay = false
		hp = 10
		get_tree().change_scene("res://scenes/gameOver/gameOver.tscn")
	if sleep == true and lay == true:
		if hp < 100:
			hp += 2 * delta
			
