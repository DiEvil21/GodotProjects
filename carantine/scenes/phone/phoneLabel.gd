extends Label


# Declare member variables here. Examples:
var dolg

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dolg == true and Global.cash > 500:
		$phoneLabel.text = 'вы попросили в долг, репутация -5'
		Global.cash += 500
		Global.rep -= 5




func _on_Button_button_down():
	dolg = true


func _on_Button_button_up():
	dolg = false
