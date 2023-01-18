extends Label

var score = 1
func _physics_process(delta):
	set_text(GlobalInfo.score as String)
