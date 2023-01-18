extends Spatial

var anim = $RootNode/AnimationPlayer.get_animation("mixamo.com")
func _ready():
	anim.set_loop(true)
	$RootNode/AnimationPlayer.play("mixamo.com")
