extends Node2D


func _ready():
	Global.score = 0



func _physics_process(delta):
	print(visible)
	$score/score_margin/CenterContainer/VBoxContainer/Label.text = "Your score: " + String(Global.score)


func _on_Button_pressed():
	get_tree().reload_current_scene()


func _on_player_tree_exited():
	$Restart.visible = true
