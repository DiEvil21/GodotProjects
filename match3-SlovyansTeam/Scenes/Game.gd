extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Control/MarginContainer/VBoxContainer/HBoxContainer/Label.set_text("score: " + String(Global.score))


func _on_Button_pressed():
	Global.score = 0
	get_tree().change_scene("res://Scenes/menu_scene/menu.tscn")


func _on_Button2_pressed():
	#restart
	Global.score = 0
	get_tree().reload_current_scene()
