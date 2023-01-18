extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.compOn = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.takeSig == true:
		$panel.visible = true
		if Global.rep > 5:
			$panel/VBoxContainer/Label.text = 'Вы уверены что хотите стрельнуть сижку у соседа?'
		else:
			$panel/VBoxContainer/Label.text = 'Не хватает репутации, чтобы просить сигу'
	if Global.takeSig == false:
		if Global.phone == true:
			$panel.visible = true
			$panel/VBoxContainer/Label.text = 'Вы уверены что хотите использовать телефон?'
		if Global.phone == false:
			
			if Global.smoke == true:
						$panel.visible = true
						$panel/VBoxContainer/Label.text = 'Вы уверены что хотите курить?'
			if Global.smoke2 == true:
				$panel.visible = false
				$exit.visible = true
			if Global.compOn == true:
				$panel.visible = true
				$panel/VBoxContainer/Label.text = 'Вы уверены что хотите сесть за компьютер?'
			#-------------------кроватка--------------
			if Global.smoke == false:
				if Global.compOn == false:
					
					if Global.sleep == true:
						$panel.visible = true
						$panel/VBoxContainer/Label.text = 'Вы уверены что хотите спать?'
					else:
						$panel.visible = false
					if Global.sleep == true and Global.lay == true:
						$panel.visible = false
					if Global.lay == true:
						$exit.visible = true
					else:
						$exit.visible = false

func _on_yes_pressed():
	if Global.takeSig == true:
		if Global.rep > 5:
			Global.sig += 1
			Global.rep -= 5
	if Global.phone == true:
		$panel.visible = false
		get_tree().change_scene("res://scenes/phone/phone.tscn")
	if Global.smoke == true:
		Global.sig -= 1
		Global.hp -=10
		Global.happy +=10
		Global.smoke2 = true
		$panel.visible = false
	if Global.compOn == true:
		$panel.visible = false
		get_tree().change_scene("res://scenes/comp/comp.tscn")
	if Global.sleep == true:
		Global.happy -= 15
		Global.lay = true
		$panel.visible = false


func _on_no_pressed():
	if Global.takeSig == true:
		Global.takeSig = false
		$panel.visible = false
	if Global.phone == true:
		Global.phone = false
		$panel.visible = false
	if Global.smoke == true:
		Global.smoke2 = false
		Global.smoke = false
		$panel.visible = false
	if Global.compOn == true:
		Global.compOn = false
		$panel.visible = false
	if Global.sleep == true:
		Global.sleep = false
		$panel.visible = false


func _on_exit_pressed():
	if Global.smoke2 == true:
		Global.smoke = false
		Global.smoke2 = false
	if Global.sleep == true:
		Global.sleep = false
		Global.lay = false
