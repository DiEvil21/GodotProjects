extends CanvasLayer


onready var sigLabel = get_node("MarginContainer/VBoxContainer/HBoxContainer/Label")
onready var cashLabel = get_node('MarginContainer/VBoxContainer/HBoxContainer2/Label')
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	sigLabel.text = String(Global.sig)
	cashLabel.text = String(Global.cash)
