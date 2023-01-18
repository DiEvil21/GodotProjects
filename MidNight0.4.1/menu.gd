extends Spatial

var scene = preload("res://game_scene/game.tscn")


func _ready():
	$Control/AnimationPlayer.play("afkbuttonmove")
func _physics_process(delta):
	but()
		
func but():
	if $Control/TextureButton.is_pressed():
			#$Control/AnimationPlayer.play('loadrev')
			get_tree().change_scene_to(scene)
			


