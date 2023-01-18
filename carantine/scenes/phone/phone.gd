extends CanvasLayer



var dolg
var spor
var rng = RandomNumberGenerator.new()

func _ready():
	pass

func _process(delta):
	#print(randomIt(0,2))
	if dolg == true:
		if Global.rep > 5:
			$MarginContainer/VBoxContainer/phoneLabel.text = 'вы попросили в долг, репутация -5'
			$AnimationPlayer.play("text")
			Global.cash += 500
			Global.rep -= 5
			dolg = false
		else:
			$MarginContainer/VBoxContainer/phoneLabel.text = 'Не хватает репутации'
			$AnimationPlayer.play("text")
			dolg = false
	if spor == true:
		print('1111')
		if Global.rep > 5 and Global.cash >500:
			if randomIt(0,1) == 0:
				print('222')
				$MarginContainer/VBoxContainer/phoneLabel.text = 'вы пороспорили, - 500, - 5 репутации'
				$AnimationPlayer.play("text")
				Global.cash -= 500
				Global.rep -= 5
				spor = false
			else:
				$MarginContainer/VBoxContainer/phoneLabel.text = 'спор удался , + 500 денег , - 2 репутации'
				$AnimationPlayer.play("text")
				Global.cash += 500
				Global.rep -= 2
				spor = false
		else:
			$MarginContainer/VBoxContainer/phoneLabel.text = 'Не хватает репутации или денег'
			$AnimationPlayer.play("text")
			spor = false


func randomIt(a,b):
	rng.randomize()
	return rng.randi_range(a, b)










func _on_spor_pressed():
	spor = true
	


func _on_Button_pressed():
	dolg = true
	$AnimationPlayer.play("text")
