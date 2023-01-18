extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_Button_pressed():
	Global.width = $MarginContainer/VBoxContainer/HBoxContainer/SpinBoxW.get_value()
	Global.height = $MarginContainer/VBoxContainer/HBoxContainer2/SpinBoxH.get_value()
	get_tree().change_scene("res://Scenes/Game.tscn")

