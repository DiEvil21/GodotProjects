extends CanvasLayer


var hide =false
var catca = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if hide == true:
		$MarginContainer.visible = false
	if catca == true:
		if Global.happy > 15:
			Global.happy -= 15
			Global.rep += 20
			$MarginContainer/VBoxContainer/Label.text = 'Вы затащили катку, + 20 репутации, - 15 настроения'
			$AnimationPlayer.play("comptext")
			catca = false
		else:
			$MarginContainer/VBoxContainer/Label.text = 'Вам не хватает настроения'


func _on_TextureButton_pressed():
	Global.casino = true


func _on_TextureButton3_pressed():
	$AnimationPlayer.queue("comptext")
	catca = true
